class Booking < ApplicationRecord
  attr_accessor :participants_number
  belongs_to :instructor, class_name: :User, foreign_key: :user_id

  belongs_to :user
  has_many :reviews
  has_many :reviews, dependent: :destroy
  has_many :user_bookings, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true, inclusion: { in: Category::CATEGORIES }

  scope :past, -> { where("end_date < ?", Date.today) }
  scope :upcoming, -> { where("end_date > ?", Date.today) }


  def available_spots
    total = user_bookings.map(&:participants_number).sum
    max_numbers_of_participants - total
  end

  def max_numbers_of_participants
    4
  end

  def self.available
    select {|booking| booking.available_spots > 0 }
  end

end
