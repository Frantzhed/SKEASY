class Booking < ApplicationRecord
  belongs_to :instructor, class_name: :User, foreign_key: :user_id

  belongs_to :user
  has_many :reviews
  has_many :user_bookings

  has_many :reviews, dependent: :destroy
  has_many :user_bookings, dependent: :destroy


  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true, inclusion: { in: Category::CATEGORIES }

  scope :past, -> { where("end_date < ?", Date.today) }
  scope :upcoming, -> { where("end_date > ?", Date.today) }
end
