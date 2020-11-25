class Category < ApplicationRecord
  CATEGORIES = ["Ski","Snowboard","Mono-ski","Handiski"]
  belongs_to :user
  validates :name, inclusion: { in: CATEGORIES }
  validates :note, inclusion: { in: (0..5) }
end
