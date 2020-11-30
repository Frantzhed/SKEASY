class UserBooking < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :participants_number, inclusion: { in: (1..4) }
end
