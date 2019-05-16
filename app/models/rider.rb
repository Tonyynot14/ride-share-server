class Rider < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  belongs_to :organization
  has_many :tokens, dependent: :destroy
  has_many :riders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
