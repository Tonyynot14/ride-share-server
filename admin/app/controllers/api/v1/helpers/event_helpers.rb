module API
  module V1
    module Helpers
      module EventHelpers
        # extend Grape::API::V1::Helpers


        def createEvents(events, recurrences)
          # all_events = []
          # events.each do |e|
          #   pattern = RecurringPattern.where(schedule_window_id: e.id)
          #   dayOfWeek = Date.today.wday
          #   eventDayofWeek = e.day_of_week
          #   currentDate = Date.today
          #   0.upto(recurrences) do |n|
          #     currentDate+n.days
          #     all_events.push({"start_date": currentDate, "end_date": currentDate, "start_time": e.start_time, "end_time": e.end_time})
          #   end
          # end
          # return all_events

        end
      end
    end
  end
end

