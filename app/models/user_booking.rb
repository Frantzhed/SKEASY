class UserBooking < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :participants_number, inclusion: { in: (1..4) }
  
  after_save :set_booking_participants

  private

  # Everytime a UserBooking gets created/updated, recalculate the participants_counter on the associated booking
  def set_booking_participants
    booking.calculate_participants
  end
end
