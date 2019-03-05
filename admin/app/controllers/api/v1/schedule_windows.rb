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
              if patternDayOfWeek >= dayOfWeek
                currentEventDate = currentEventDate+(patternDayOfWeek-dayOfWeek).days
              else
                currentEventDate = currentEventDate+(7-dayOfWeek + patternDayOfWeek).days
              end
              recurrences.times do |n|
                currentEventDate = currentEventDate+n.weeks
                all_events.push({"event_id": event.id, "start_date": currentEventDate, "end_date": currentEventDate, "start_time": event.start_time, "end_time": event.end_time})
              end
            end
        end

        def createNonRecurringEvents(events, all_events)
          events.each do |event|
            all_events.push({"event_id": event.id, "start_date": event.start_date, "end_date": event.end_date, "start_time": event.start_time, "end_time": event.end_time})
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

      # desc "Create an schedule window for a driver"
      # params do
      #   requires :id, type: String, desc: "Driver id"
      # end
      # post "schedules/:id" do
      #   ScheduleWindow.create!()
      # end

    end
  end
end