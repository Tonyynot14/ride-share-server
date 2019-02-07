class Driver < ApplicationRecord
  validates :name, presence: true,
            length: { minimum: 2 }
  validates :phone, presence: true
  validates :email, presence: true
end
