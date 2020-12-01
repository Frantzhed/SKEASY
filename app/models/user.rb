class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  TECHNICALSKILL = ["Beginner","Intermediate","Good-Level","Expert"]
  LANGUAGES = ["French","English","Russian", "German", "Arabic", "Italian", "Spanish"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :user_bookings, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :client_bookings, through: :user_bookings, class_name: "Booking", source: "booking"
  validates :technical_skill, presence: true, inclusion: { in: User::TECHNICALSKILL }
  validate :languages_included_in_list
  has_one_attached :photo
  attr_accessor :category

  scope :instructor, -> {where(instructor: true)}


  def booked_instructors
    user_bookings.map(&:booking)
  end

  def average_rating
    if reviews.count == 0
      puts "No mark yet "
    else
      reviews.map(&:rate).sum / reviews.count
    end
  end

  private

  def languages_included_in_list
    return if languages.blank?

    languages.each do |language|
      if LANGUAGES.include?(language) == false
        return errors.add(:languages, "must be included in the list")
      end
    end
  end
end



