class Booking < ApplicationRecord
  attr_accessor :participants_number
  PARTICIPATION_LIMIT = 4
  belongs_to :instructor, class_name: :User, foreign_key: :user_id

  belongs_to :user
  has_many :reviews
  has_many :reviews, dependent: :destroy
  has_many :user_bookings, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true, inclusion: { in: Category::CATEGORIES }
  validates :status, inclusion: { in: ["Pending", "Accepted", "Rejected"] }

  scope :past, -> { where("end_date < ?", Date.today) }
  scope :upcoming, -> { where("end_date > ?", Date.today) }
  scope :available, -> { where('participant_counter < ?', PARTICIPATION_LIMIT)}


  def available_spots
    total = user_bookings.map(&:participants_number).sum
    PARTICIPATION_LIMIT - total
  end

  # Method called everytime a UserBooking is saved
  def calculate_participants
    update(participant_counter: user_bookings.map(&:participants_number).sum)
  end

  def individual_price
    (price / (user_bookings.flat_map(&:participants_number).sum )).truncate(2)
  end

  # Ruby implementation that results in way too many SQL queries. Replaced by a participant_counter updated through ActiveRecord callbacks.
  # Details in PR
  # def self.available
  #   select {|booking| booking.available_spots > 0 }
  # end

end
