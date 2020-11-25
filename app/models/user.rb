class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :user_bookings
  has_many_attached :photos


  def booked_instructors
    user_bookings.map(&:booking)
  end


end
