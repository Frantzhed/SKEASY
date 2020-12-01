class AddParticipantCounterToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :participant_counter, :integer, default: 0
  end
end
