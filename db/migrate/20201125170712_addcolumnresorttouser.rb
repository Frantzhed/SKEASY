class Addcolumnresorttouser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ski_resort, :string
  end
end
