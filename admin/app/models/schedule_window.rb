class ScheduleWindow < ApplicationRecord

  belongs_to :driver
  has_one :recurring_pattern
end
