class UserBooking < ApplicationRecord
  belongs_to :client, class_name: :User, foreign_key: :user_id
  belongs_to :booking
end
