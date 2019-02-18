class Organization < ApplicationRecord
  has_many :drivers
  has_many :riders
  has_many :rides
end
