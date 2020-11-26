# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
puts "review destroy"
Booking.destroy_all
puts "booking destroy"
Category.destroy_all
puts "category destroy"
User.destroy_all
puts "user destroy"

category = ["Ski","Snowboard","Mono-ski","Handiski"]
technical_skill = ["Beginner","Intermediate","Good-Level","Expert"]
languages = ["French","English","Russian", "German", "Arabic"]
emails = ["frantzhed@gmail.com", "yass@gmail.com"]
Review.destroy_all
User.destroy_all





  user = User.new(instructor: true, email: emails.sample , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: Faker::Lorem.paragraphs, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample].uniq, ski_resort: "Megeve", technical_skill: technical_skill.sample)
2.times do |index|
  user = User.new(instructor: true, email: Faker::Internet.email , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: Faker::Lorem.paragraphs, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample].uniq, ski_resort: "Megeve", technical_skill: technical_skill.sample)
  user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user#{index + 1}.jpg")), filename: 'photo.jpg')
  user.save!
  puts "Created one user"
  Category.create!(name: category.sample, note: rand(0..5), user_id: User.last.id )
  puts "Created one category"
  Booking.create!(category: category.sample, price: 50, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )
  puts "Created one booking"

  Review.create!(content: "Very Good experience", rate:4, user_id: User.last.id, booking_id: Booking.last.id)

end
