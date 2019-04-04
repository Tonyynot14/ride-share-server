module Api
  module V1
    class ScheduleWindows < Grape::API
      include Api::V1::Defaults


      helpers do
        def create_recurring_events(events, first_date, last_date, all_events)
          events.each do |event|
            event_pattern = RecurringPattern.where(schedule_window_id: event.id).first!
            day_of_week = Date.today.wday
            pattern_day_of_week = event_pattern.day_of_week
            current_event_date = first_date
            location = Location.find(event.location_id)
            if pattern_day_of_week >= day_of_week
              current_event_date = current_event_date+(pattern_day_of_week-day_of_week).days
            else
              current_event_date = current_event_date+(7-day_of_week + pattern_day_of_week).days
            end
            week_counter = 0
            while current_event_date < last_date
              current_event_date = current_event_date+week_counter.weeks
              all_events.push({"eventId": event.id, "startDate": current_event_date, "endDate": current_event_date, "startTime": event.start_time, "endTime": event.end_time, "isRecurring": event.is_recurring, "location": location})
              week_counter +=1
            end
          end
        end

        def create_nonrecurring_events(events, all_events)
          events.each do |event|
            location = Location.find(event.location_id)
            all_events.push({"eventId": event.id, "startDate": event.start_date, "endDate": event.end_date, "startTime": event.start_time, "endTime": event.end_time, "isRecurring": event.is_recurring, "location": location})
          end
        end

        def create_all_events(schedules, start_date, stop_date, all_events)
          repeating_events = []
          non_repeating_events = []
          schedules.each do |e|
            if e.is_recurring
              repeating_events.push(e)
            else
              non_repeating_events.push(e)
            end
          end
          create_recurring_events(repeating_events, start_date, stop_date, all_events)
          create_nonrecurring_events(non_repeating_events, all_events)
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
        requires :start, type: Time
        requires :end, type: Time
      end
      get "schedules/:id", root: :schedule_windows do
        schedules = ScheduleWindow.where(driver_id: permitted_params[:id])
        all_events = []
        puts "beginning"
        puts params[:start]
        puts params[:end]
        puts "end"
        create_all_events(schedules, params[:start], params[:end], all_events)
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
        create_all_events(schedule, Date.today, Date.today+1.year, all_events)
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