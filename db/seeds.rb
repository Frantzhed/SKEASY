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





user = User.new(
  instructor: false,
  email: "patrick@gmail.com",
  password: "123456",
  first_name: "Noémie",
  last_name: "Sebastien",
  phone_number: "+33 6 56 86 96 26",
  description: "Hello everyone, my name is Patrick, i've been living in Haute Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.
  I would be thrilled to become your new teacher for your holidays",
  languages: ["French", User::LANGUAGES.sample].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/jess.jpg")), filename: 'photo.jpg')
user.save!

user = User.new(
  instructor: false,
  email: "guillaume@gmail.com",
  password: "123456",
  first_name: "Léa",
  last_name: "Chevalier",
  phone_number: "+33 6 56 86 96 26",
  description: "Hello everyone, my name is Guillaume, i've been living in Haute Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.
  I would be thrilled to become your new teacher for your holidays",
  languages: ["French", User::LANGUAGES.sample].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/léa.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now )
puts "Created one booking"


user = User.new(
  instructor: true,
  email: "dorian@gmail.com",
  password: "123456",
  first_name: "Dorian",
  last_name: "Di Mino",
  phone_number: "+33 6 42 38 67 29",
  description: "What's up guys, i'm dorian and if you want to enjoy a incredible ride
  full of events and of unexpected experiences i'm your man. I like skiing in a sport mode :
  if you choose me as your teacher, we're going intense and you won't regret it i promise.",
  languages: ["French", User::LANGUAGES.sample].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Sebastian-Keiler.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Intense course which i won't recommand to everybody, but personnaly i loved it !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Sport mode with Dorian is the best !", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "I wanted to chill... Wrong course.", rate: 1, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Incredible moments with Dorian for sure.", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: false,
  email: "nicolas@gmail.com",
  password: "123456",
  first_name: "Nicolas",
  last_name: "Le Bechec de Redon",
  phone_number: "+33 6 56 86 96 26",
  description: "I'm nicolas i want to save money by sharing group lessons",
  languages: ["French", User::LANGUAGES.sample].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/nicolas.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: category.sample, note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: category.sample, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"
Booking.create!(category: "Snowboard", group_session: true,
  user_id: User.find_by(first_name: "Dorian").id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date: DateTime.parse("09/01/2021 19:00"), start_time: Time.now, end_time: (Time.now)+ 2, status: "Accepted", user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3])
puts "Created one booking"
UserBooking.create!(user_id: User.find_by(first_name: "Nicolas").id, booking_id: Booking.last.id)
puts "Created one Userbooking"

user = User.new(
  instructor: true,
  email: "Pauline@gmail.com",
  password: "123456",
  first_name: "Pauline",
  last_name: "Stuart",
  phone_number: "+33 6 24 92 78 19",
  description: "My name is Pauline. I grew up in Megeve!
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need I will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English","Russian"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Pauline.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: "Ski", amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:DateTime.parse("09/04/2019 19:00"), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time, she's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Peta@gmail.com",
  password: "123456",
  first_name: "Peta",
  last_name: "Francois",
  phone_number: "+33 6 24 32 78 19",
  description: "Hello, my name is Peta. I'm from the Lyon!
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need I will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Marguerite.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: "Ski", amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:DateTime.parse("09/04/2019 19:00"), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time, she's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Flore@gmail.com",
  password: "123456",
  first_name: "Flore",
  last_name: "Renard",
  phone_number: "+33 6 24 32 89 19",
  description: "Hello, my name is Flore. I'm from the east coast of France!
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need i will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English","Spanish"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Flore.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: "Ski", group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:DateTime.parse("09/04/2019 19:00"), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"
UserBooking.create!(user_id: User.find_by(first_name: "Nicolas").id, booking_id: Booking.last.id)


reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time, she's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)


user = User.new(
  instructor: true,
  email: "lucas@gmail.com",
  password: "123456",
  first_name: "Lucas",
  last_name: "Haymann",
  phone_number: "+33 6 32 38 48 19",
  description: "Yo everybody, my name is Lucas, i'm a professional ski racer, i've won
  multiples ski and competitions in France, Canada, Austria and Germany. Skiing is basically
  all i've ever done in my entire life. I can speak french, english, german and a bit of
  russian. I can do course to toddlers but also to seniors : nothing in life is an obstacle.
  If you're looking for the best ski teacher in Megeve i think you've just found him ! ;)",
  languages: ["French", "English", "German", "Russian"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user3.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
puts "Created one category"


Booking.create!(category: category.sample, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"
UserBooking.create!(user_id: User.find_by(first_name: "Nicolas").id, booking_id: Booking.last.id)


reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Lucas is a bit arrogant, but still he is a good ski teacher", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nice to find a ski teacher who speaks russian", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Cool class !", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times with good teacher", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Waste of time", rate: 0, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "melanie@gmail.com",
  password: "123456",
  first_name: "Mélanie",
  last_name: "Laudy",
  phone_number: "+33 (00) 12 24 18 19",
  description: "Hello, y name is Melanie. I will be thrilled to become your ski teacher.
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need i will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English", "Italian", "Spanish"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/melanie.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time with Menalie, she's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Rose@gmail.com",
  password: "123456",
  first_name: "Rose",
  last_name: "Mickael",
  phone_number: "+33 6 34 32 18 19",
  description: "Hello, my name is Rose. I'm from the south coast!
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need i will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Rose.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time, she's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "John@gmail.com",
  password: "123456",
  first_name: "John",
  last_name: "Lauryn",
  phone_number: "+33 6 12 45 18 19",
  description: "Hello, y name is John. I will be thrilled to become your ski teacher.
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need i will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "English", "Spanish"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/John.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time with John, he's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Kameron@gmail.com",
  password: "123456",
  first_name: "Kameron",
  last_name: "Lie",
  phone_number: "+33 6 12 45 18 19",
  description: "I'm Kameron. Ready to ride ? I will be thrilled to become your ski/snowboard teacher.
  I know the resort by heart so if you come with you'll be in good hands. I speak
  multiples languages, and if you have questions i can answer quickly. Let me know
  your level, your mindset and your need i will adapt. I'm enthousiastic to
  experience new adventures with you !",
  languages: ["French", "Spanish"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Kameron.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Excellent teacher, wonderful time with Kameron, he's the best", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great times in a beautiful place with nice people", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's the best !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's been a while since i've enjoyed a course that much", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "claude@gmail.com",
  password: "123456",
  first_name: "Claude",
  last_name: "Duroy",
  phone_number: "+33 6 34 12 68 78",
  description: "Hey ! I'm claude, i'm a vieux loup de mer in terms of ski. I know everything
  about the art of skiing : la peau de phoque, le bruit de la neige quand tu marches dessus
  (le petit floc-floc), la différence entre une piste verte et une piste noire... Basically
  everything. If you want to have an incredible experience in Megeve, i'm your man.",
  languages: ["French"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Lee.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Intense times, i slept very easily the night after the class", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Claude is really good teacher you won't regret it", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Good times with someone who knows what he's doing", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Cool course, nice views", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Can we still be a good teacher when we're senior ? Well... Claude can.", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)


user = User.new(
  instructor: true,
  email: "camille@gmail.com",
  password: "123456",
  first_name: "Camille",
  last_name: "Graziani",
  phone_number: "+33 6 45 76 89 32",
  description: "Hey, i'm Camille, i'm a junior ski teacher. Tell me if you want to
  book a course in the resort",
  languages: ["French"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/camille.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "A young and shy teacher, give him some time", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Not that cool", rate: 2, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "I feel like it could have been way better", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Cool", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Young and sadly not enough experienced with the teaching thing", rate: 1, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "paul@gmail.com",
  password: "123456",
  first_name: "Paul",
  last_name: "Rouet",
  phone_number: "+33 6 57 64 35 24",
  description: "Hey ! I'm Paul ! Everybody knows me in Haute-Savoie, because
  i have the reputation of beeing the best ski teacher in the area, and not to be
  too arrogant, but i think these rumors are true. Take me as your instructor, and i garanti
  you that there won't be a slice of regret !",
  languages: ["French", "English", "Russian"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/paul.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nothing to say, the man is good", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Beeing humble can help in life", rate: 2, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Don't like the guy", rate: 1, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great job", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's a dickhead", rate: 0, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Jess@gmail.com",
  password: "123456",
  first_name: "Jess",
  last_name: "Gomes",
  phone_number: "+33 6 14 56 27 32",
  description: "Hello everybody, my name is Jess and i would love to become
  your ski teacher for your holidays. I knonw the resort by heart, i can teach to any type of
  level you're looking for, i can adapt to any mindset that you want and to any age no
  distinction whatsoever. Let me know if you would be interested, i'm already looking forward
  to spend great times and especially great adventures with you !",
  languages: ["French", "English", "Italian"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/preise.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"

Category.create!(name: "Mono-ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Good teacher, we had a great time with my familly", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Brilliant teacher, she knows the best spot", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great experience with Alex she's really cool", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Fun times", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Always cool to see an old friend", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "raphael@gmail.com",
  password: "123456",
  first_name: "Raphael",
  last_name: "Herrera",
  phone_number: "+33 6 56 56 19 34",
  description: "Holà todos, my name is Raphael, i've been living in Haute Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.
  I would be thrilled to become your new teacher for your holidays",
  languages: ["French", "English", "Spanish"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/raphael.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: 5, user_id: User.last.id )

puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nice guy, very simple and a good instructor", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's true, he knows the best posts", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nothing to say ! It was just super nice", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great class", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's definitely the best ski instructor", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "elodie@gmail.com",
  password: "123456",
  first_name: "Elodie",
  last_name: "Ferrando",
  phone_number: "+33 6 18 46 32 79",
  description: "Hi, my name is Elodie. Originally i was living in Paris but one day i decided to quit
  everything : my flat, my job, my hometown to do what i always loved to do : Skiing ! That's how i
  became a ski teacher in Megeve and i'm currently living the best time of my life. I would be
  honored to make you discover this wonderful place full of incredible views and of amazing people.
  If you have any questions let me know i answer fast trying to be the more avaible for you. See you soon ! :)",
  languages: ["French", "English", "German", "Spanish"].uniq,
  ski_resort: "Val d'isère",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/elodie.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )


Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"


Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Wonderful time with a brillant teacher", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Cool experience", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Always nice to talk with someone who's passionate with what he's doing", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "She's incredible", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "I highly recommand this teacher", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Nathan.gentil@gmail.com",
  password: "123456",
  first_name: "Nathan",
  last_name: "Gentil",
  phone_number: "+33 6 56 46 79 34",
  description: "Holà todos, my name is Nathan, i've been living in Haute Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.
  I would be thrilled to become your new teacher for your holidays",
  languages: ["French", "English"].uniq,
  ski_resort: "Tignes",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Nathan.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )

puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nice guy, very simple and a good instructor", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's true, he knows the best posts", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nothing to say ! It was just super nice", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great class", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's definitely the best ski instructor", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "Valentin.gentil@gmail.com",
  password: "123456",
  first_name: "Valentin",
  last_name: "Gentil",
  phone_number: "+33 6 56 46 79 45",
  description: "My name is Valentin, I've been living in Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.",
  languages: ["French", "English"].uniq,
  ski_resort: "Les Arcs",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Valentin.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )

puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now  )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nice guy, very simple and a good instructor", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's true, he knows the best posts", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nothing to say ! It was just super nice", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great class", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's definitely the best ski instructor", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)


user = User.new(
  instructor: true,
  email: "Joacquim.gentil@gmail.com",
  password: "123456",
  first_name: "Joacquim",
  last_name: "Rodriguez",
  phone_number: "+33 6 75 46 79 45",
  description: "My name is Joacquim, I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey, I've been living in Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast",
  languages: ["French", "Arabic"].uniq,
  ski_resort: "Tignes",
  technical_skill: technical_skill.sample,
  price_cents: 5000

)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/Joacquim.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )
Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )

puts "Created one category"
Booking.create!(category: category.sample, amount: 45, group_session: false,
  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nice guy, very simple and a good instructor", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "It's true, he knows the best posts", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nothing to say ! It was just super nice", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Great class", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "He's definitely the best ski instructor", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: true,
  email: "nathan@gmail.com",
  password: "123456",
  first_name: "Nathan",
  last_name: "Kassabi",
  phone_number: "+33 6 56 86 96 26",
  description: "Hello everyone, my name is Nathan, i've been living in Haute Savoie all my life
  and skiing in these mountains is what have been doing since i'm a kid. I would love to
  take you with you to show you the beauty of this incredible place which is out of time. I can
  adapt to any level of skiing and any mood you want to practice this amazing sport. Let me
  know if you have any questions i can answer really fast. I am able to do traditionnal courses or
  off pistes and backcountry if you're ready to do experience a more adventurous journey.
  I would be thrilled to become your new teacher for your holidays",
  languages: ["French", User::LANGUAGES.sample].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/emanuel_bellwald_530.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"

Category.create!(name: "Snowboard", note: rand(1..5), user_id: User.last.id )

Category.create!(name: "Handiski", note: rand(1..5), user_id: User.last.id )
puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"


reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Nathan is a great ski teacher, you won't regret your course with him !", rate: 5, user_id: reviewer.id, booking_id: Booking.last.id)
reviewer = User.where.not(id: user.id).sample
Review.create!(content: "Beautiful experience with someone who is passionated by his work and the domain", rate: 3, user_id: reviewer.id, booking_id: Booking.last.id)
# Review.create!(content: "Great class !", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)
# Review.create!(content: "Personnaly everybody loved the class but i did not", rate: 2, user_id: reviewer.id, booking_id: Booking.last.id)
# Review.create!(content: "Nice moment with Nathan", rate: 4, user_id: reviewer.id, booking_id: Booking.last.id)

user = User.new(
  instructor: false,
  email: "neymar@gmail.com",
  password: "123456",
  first_name: "Jean",
  last_name: "Neymar",
  phone_number: "+33 6 67 35 92 76",
  description: "Hello. Haters are going to hate, but i have to say it :
  I'm the best football player today.",
  languages: ["French", "English", "Spanish", "Italian"].uniq,
  ski_resort: "Megeve",
  technical_skill: technical_skill.sample,
  price_cents: 5000
)
user.photo.attach(io: File.open(Rails.root.join("db/fixtures/user4.jpg")), filename: 'photo.jpg')
user.save!
puts "Created one user"
Category.create!(name: "Ski", note: rand(1..5), user_id: User.last.id )

puts "Created one category"

Booking.create!(category: category.sample, amount: 45, group_session: false,

  user_id: User.last.id, start_date: Faker::Date.between(from:30.days.ago, to: Date.today),
  end_date:Faker::Date.between(from:Date.today, to: 30.days.from_now), user_sku: User.last.first_name[0..3] + "-" + User.last.last_name[0..3], start_time: Time.now, end_time: Time.now   )
puts "Created one booking"

Review.create!(content: "True", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
Review.create!(content: "Yeah he's the best", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
Review.create!(content: "People who will say the opposite are douchebags", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
Review.create!(content: "The best", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
Review.create!(content: "Incredible player", rate: 5, user_id: User.last.id, booking_id: Booking.last.id)
