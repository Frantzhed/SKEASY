class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  TECHNICALSKILL = ["Beginner","Intermediate","Good-Level","Expert"]
  LANGUAGES = ["French","English","Russian", "German", "Arabic"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :user_bookings
  has_many :categories
  has_many :client_bookings, through: :user_bookings, class_name: "Booking", source: "booking"

  validates :technical_skill, presence: true, inclusion: { in: User::TECHNICALSKILL }


  has_many_attached :photos
  attr_accessor :category

  scope :instructor, -> {where(instructor: true)}


  def booked_instructors
    user_bookings.map(&:booking)
  end

  def average_rating
    reviews.map(&:rate).sum / reviews.count
  end


end
