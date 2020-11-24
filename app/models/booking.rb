class Booking < ApplicationRecord
  belongs_to :instructor, class_name: :User, foreign_key: :user_id
  has_many :reviews
  has_many :user_bookings

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true, inclusion: { in: ["Ski", "Snowboard", "Handiski", "Telemark"] }

  scope :past, -> { where("end_date < ?", Date.today) }
  scope :upcoming, -> { where("end_date > ?", Date.today) }
end
