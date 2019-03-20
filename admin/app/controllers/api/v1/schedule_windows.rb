module API
  module V1
    class ScheduleWindows < Grape::API
      include API::V1::Defaults
      helpers V1::Helpers::EventHelpers



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
        create_all_events(schedule, all_events)
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