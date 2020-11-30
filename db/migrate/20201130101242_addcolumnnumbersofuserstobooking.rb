class Addcolumnnumbersofuserstobooking < ActiveRecord::Migration[6.0]
  def change
    add_column :user_bookings, :participants_number , :integer, default: 1
  end
end
