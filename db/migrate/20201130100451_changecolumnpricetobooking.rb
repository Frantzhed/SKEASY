class Changecolumnpricetobooking < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :price, :float
  end
end
