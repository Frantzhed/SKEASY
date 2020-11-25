class RemoveColumnCategoriesToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :categories, :string
  end
end
