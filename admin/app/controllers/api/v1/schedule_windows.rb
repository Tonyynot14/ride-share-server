
module Api
  module V1
    class ScheduleWindows < Grape::API
      include Api::V1::Defaults
      helpers EventHelpers



      desc "Return all schedule windows"
      get "availabilities", root: :schedule_windows do
        ScheduleWindow.all
      end



      desc "Get a full schedule for a driver"
      params do
        requires :id, type: String, desc: "ID of the driver"
        optional :start, type: Time, desc: "Start date for schedule"
        optional :end, type: Time, desc: "End date for schedule"
      end
      get "availabilities/:id", root: :schedule_windows do
        schedules = ScheduleWindow.where(driver_id: permitted_params[:id])
        all_events = []
        start_time = DateTime.now
        end_time = DateTime.now+3.months
        create_all_events(schedules, start_time, end_time, all_events)
        render json: all_events
      end


      desc "Get a specific schedule window for a driver"
      params do
        requires :id, type: String, desc: "ID of the event"
      end
      get "availabilities/window/:id", root: :schedule_windows do
        schedule = ScheduleWindow.where(id: permitted_params[:id])
        all_events = []
        create_all_events(schedule, Date.today, Date.today+1.year, all_events)
        render json: all_events
      end




      desc "Create an schedule window for a driver"
      params do
        requires :id, type: String, desc: "ID of driver"
      end
      post "availabilities/:id" do

        schedule_window = ScheduleWindow.create(driver_id: params[:id], start_date: params[:start_day], end_date: params[:end_day], start_time: params[:start_time],end_time: params[:end_time], location_id: params[:location_id], is_recurring: params[:is_recurring])
        if params[:is_recurring] == true
          RecurringPattern.create(schedule_window_id: schedule_window.id, day_of_week: schedule_window.start_time.wday)
        end
        render schedule_window
      end

    end
  end
end