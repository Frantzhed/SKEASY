class AddDefaultToInstructor < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :instructor, :boolean, default: false
  end
end
