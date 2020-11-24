class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user, class_name: :User, foreign_key: :user_id

  validates :rate, presence: true, inclusion: { in: [0,1,2,3,4,5] }
  
end
