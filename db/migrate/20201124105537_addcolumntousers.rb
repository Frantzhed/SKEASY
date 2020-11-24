class Addcolumntousers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text
    add_column :users, :language, :string
    add_column :users, :technical_skill, :string
    add_column :users, :instructor, :boolean
    add_column :users, :category, :string

  end
end
