class Beach < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true

  validates :address, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
