module API
  module V1
    class ScheduleWindows < Grape::API
      include API::V1::Defaults


      helpers do
        def createRecurringEvents(events, recurrences, all_events)
            events.each do |event|
              event_pattern = RecurringPattern.where(schedule_window_id: event.id).first!
              dayOfWeek = Date.today.wday
              patternDayOfWeek = event_pattern.day_of_week
              currentEventDate = Date.today
              location = Location.find(event.location_id)
              puts event.location_id
              if patternDayOfWeek >= dayOfWeek
                currentEventDate = currentEventDate+(patternDayOfWeek-dayOfWeek).days
              else
                currentEventDate = currentEventDate+(7-dayOfWeek + patternDayOfWeek).days
              end
              recurrences.times do |n|
                currentEventDate = currentEventDate+n.weeks
                all_events.push({"event_id": event.id, "start_date": currentEventDate, "end_date": currentEventDate, "start_time": event.start_time, "end_time": event.end_time, "is_recurring": event.is_recurring, "location": location})
              end
            end
        end

        def createNonRecurringEvents(events, all_events)
          events.each do |event|
            location = Location.find(event.location_id)
            all_events.push({"event_id": event.id, "start_date": event.start_date, "end_date": event.end_date, "start_time": event.start_time, "end_time": event.end_time, "is_recurring": event.is_recurring, "location": event.location})
          end
        end

        def createAllEvents(schedules, all_events)
          repeating_events = []
          non_repeating_events = []
          schedules.each do |e|
            if e.is_recurring
              repeating_events.push(e)
            else
              non_repeating_events.push(e)
            end
          end
          createRecurringEvents(repeating_events, 4, all_events)
          createNonRecurringEvents(non_repeating_events, all_events)
          all_events.sort_by!{|i| i[:start_time]}
          all_events.sort_by!{|i| i[:start_date]}.reverse
        end
      end





      desc "Return all schedule windows"
      get "schedules", root: :schedule_windows do
        ScheduleWindow.all
      end




      desc "Get schedule for a driver"
      params do
        requires :id, type: String, desc: "ID of the
            driver"
      end
      get "schedules/:id", root: :schedule_windows do
        schedules = ScheduleWindow.where(driver_id: permitted_params[:id])
        all_events = []
        createAllEvents(schedules, all_events)
        render json: all_events
      end


      desc "Get a specific event for a driver"
      params do
        requires :id, type: String, desc: "Id of the
            event"
      end
      get "schedules/window/:id", root: :schedule_windows do
        schedule = ScheduleWindow.where(id: permitted_params[:id])
        all_events = []
        createAllEvents(schedule, all_events)
        render json: all_events
      end




      desc "Create an schedule window for a driver"
      params do
        requires :id, type: String, desc: "Driver id"
      end
      post "schedules/:id" do

        schedule_window = ScheduleWindow.create(driver_id: params[:id], start_date: params[:start_day], end_date: params[:end_day], start_time: params[:start_time],end_time: params[:end_time], location_id: params[:location_id], is_recurring: params[:is_recurring])
        if params[:is_recurring] == true
          RecurringPattern.create(schedule_window_id: schedule_window.id, day_of_week: schedule_window.start_time.wday)
        end
        render schedule_window
      end

    end
  end
end