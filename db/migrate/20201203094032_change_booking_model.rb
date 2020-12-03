class ChangeBookingModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings,:price_cents
    add_monetize :bookings, :amount, currency: { present: false }, default: 0
    add_column :bookings, :user_sku , :string
  end
end
