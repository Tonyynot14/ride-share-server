class Ride < ApplicationRecord
  validates :rider_id, presence:true

  belongs_to :organization
  belongs_to :driver
  belongs_to :rider

end
