class ScheduleWindowSerializer < ActiveModel::Serializer

  attributes :start_date, :end_date, :start_time, :end_time
  # attributes :id, :driver_id, :start_date, :end_date, :start_time,
  #            :end_time, :is_recurring, :recurring_pattern
end