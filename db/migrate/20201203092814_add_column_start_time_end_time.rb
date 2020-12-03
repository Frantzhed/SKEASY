class AddColumnStartTimeEndTime < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
  end
end
