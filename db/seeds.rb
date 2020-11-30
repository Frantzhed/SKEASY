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
emails = ["frantzhed@gmail.com", "yass@gmail.com", "frantzzhed@gmail.com", "yasss@gmail.com", "frantzzzhed@gmail.com", "yassss@gmail.com", "frantzzzzhed@gmail.com", "yasssss@gmail.com", "test1@gmail.com","test4@gmail.com","test3@gmail.com","test2@gmail.com"]
description = [
"I've been teaching for 7 years, I love seeing how people can improve so fast!",
"I've been teaching for 2 years, I'm sure you'll learn fast!!",
"Hello I am a specialized ski teacher, I will be happy to make you discover the domain so that you will spend the best vacations",
"I am a specialized teacher, I will be please to make you discover the domain so that you will spend the best time!",
"Be the fastest on the slopes!! I will be please to make you discover the domain so that you will spend the best time!",
"Ride with me and enjoy time on the slopes, I will be please to make you discover the domain so that you will spend the best time!",
]
Review.destroy_all
User.destroy_all


11.times do |index|
  user = User.new(instructor: true, email: emails[index] , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: description.sample, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample].uniq, ski_resort: "Megeve", technical_skill: technical_skill.sample)
  user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user#{index + 1}.jpg")), filename: 'photo.jpg')
  user.save!
  puts "Created one user"
  Category.create!(name: category.sample, note: rand(0..5), user_id: User.last.id )
  puts "Created one category"
  Booking.create!(category: category.sample, price: 50, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )
  puts "Created one booking"

  Review.create!(content: "We had a wonderful day skiing with the best intructor!", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
  Review.create!(content: "We had a great day skiing with the best intructor!", rate: 3, user_id: User.last.id, booking_id: Booking.last.id)
end

11.times do |index|
  user = User.new(instructor: true, email: Faker::Internet.email , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: description.sample, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample].uniq, ski_resort: "Vars", technical_skill: technical_skill.sample)
  user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user#{index + 1}.jpg")), filename: 'photo.jpg')
  user.save!
  Category.create!(name: category.sample, note: rand(0..5), user_id: User.last.id )
  Booking.create!(category: category.sample, price: 50, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )

  Review.create!(content: "We had a wonderful day skiing with the best intructor!", rate: 5, user_id: User.all.sample.id, booking_id: Booking.last.id)
  Review.create!(content: "We had a great day skiing with the best intructor!", rate: 3, user_id: User.all.sample.id, booking_id: Booking.last.id)
end

11.times do |index|
  user = User.new(instructor: true, email: Faker::Internet.email , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: description.sample, languages: [User::LANGUAGES.sample, User::LANGUAGES.sample].uniq, ski_resort: "Val Thorens", technical_skill: technical_skill.sample)
  user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user#{index + 1}.jpg")), filename: 'photo.jpg')
  user.save!
  Category.create!(name: category.sample, note: rand(0..5), user_id: User.last.id )
  Booking.create!(category: category.sample, price: 50, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )

  Review.create!(content: "We had a wonderful day skiing with the best intructor!", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
  Review.create!(content: "We had a great day skiing with the best intructor!", rate: 3, user_id: User.last.id, booking_id: Booking.last.id)
end
