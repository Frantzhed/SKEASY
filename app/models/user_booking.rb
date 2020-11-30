class UserBooking < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :participants_number, inclusion: { in: (1..4) }
  
  before_save :increment_booking_participants, if: :will_save_change_to_participants_number?

  private

  # Everytime a UserBooking gets created/updated, we'll increment the participants_counter
  def increment_booking_participants
    # If changing the number of participants for an existing UserBooking, decrement the former value before re-incrementing the new one
    if participants_number_was
      booking.increment_participants(-participants_number_was)
    end
    booking.increment_participants(participants_number)
  end
end
