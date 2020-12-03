class UpdatePriceToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :price
    add_monetize :bookings, :price, currency: { present: false }

  end
end
