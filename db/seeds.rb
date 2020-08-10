# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

Faker::Config.locale = 'fr'

10.times do
  User.create!(
    email: "thibzlamiff2@yopmail.com",
    description: Faker::Lorem.paragraph_by_chars(number: 141, supplemental: false),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "#{User.all.count} users créés"

10.times do
  Event.create!(
    start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-29'),
    duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph_by_chars(number: 21, supplemental: true),
    price: Faker::Number.between(from: 1, to: 1000),
    location: Faker::Address.full_address,
    admin_id: rand(1..10)
  )
end

puts "#{Event.all.count} events créés"

10.times do
  Attendance.create!(
    stripe_customer_id: Faker::Name.name,
    participant_id: rand(1..10),
    event_id: rand(1..10)
  )
end

puts "#{Attendance.all.count} users créés"

puts "SEED OK"