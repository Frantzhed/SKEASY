class AddPriceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :users, :price, currency: { present: false }, default: 0
  end
end
