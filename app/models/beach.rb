class Beach < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :address, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
