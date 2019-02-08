class Ride < ApplicationRecord
  validates :rider_id, presence:true
end
