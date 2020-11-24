class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :user_bookings
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :technical_skill, presence: true, inclusion: { in: ["Beginner", "Intermediate", "Advanced", "Very advanced"] }

end
