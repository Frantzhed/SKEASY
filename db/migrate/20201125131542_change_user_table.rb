class ChangeUserTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :language, :string
    remove_column :users, :category, :string
    add_column :users, :categories, :string, array: true, default: []
    add_column :users, :languages, :string, array: true, default: []
    add_index :users, :categories, using: "gin"
    add_index :users, :languages, using: "gin"
    
  end
end
