# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

category = ["Ski","Snowboard","Mono-ski","Handiski"]
technical_skill = ["Beginner","Intermediate","Good-Level","Expert"]
languages = ["French","English","Russian", "German", "Arabic"]

15.times do

  User.create!(instructor: true, email: Faker::Internet.email , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: Faker::Lorem.paragraphs, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample], ski_resort: "Megeve", technical_skill: technical_skill.sample)
  puts "Created 15 users"
  Category.create!(name: category.sample, note: rand(0..5), user_id: User.last.id )
  puts "Created 15 categories"
  Booking.create!(category: category.sample, price: 40, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )
  puts "Created 15 bookings"

  Review.create!(content: "Very Good experience", rate:4, user_id: User.last.id, booking_id: Booking.last.id)

end
