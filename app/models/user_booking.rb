class UserBooking < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  
  scope :past, -> { where("end_date < ?", Date.today) }
  scope :upcoming, -> { where("end_date > ?", Date.today) }
end
