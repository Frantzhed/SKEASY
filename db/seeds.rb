# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = ["Ski", "Snowboard", "Handiski", "Telemark"]
require 'faker'
15.times do
User.create!(instructor: true, email: Faker::Internet.email , password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, description: Faker::Lorem.paragraphs, languages: ["english", "french"] , categories: category.sample, )
Booking.create!(category: category.sample, price: 40, group_session: Faker::Boolean.boolean, user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today), end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now)  )
end
