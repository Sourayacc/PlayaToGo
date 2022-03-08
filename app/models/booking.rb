class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beach

  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
