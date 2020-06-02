# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']
I18n.locale = 'fr-FR'

time.20 do |x|
  user = User.new
  user.email = Faker::Internet.free_email
  user.password = 'password'
  user.full_name = Faker::FunnyName.name
  user.phone = Faker::PhoneNumber.phone_number
  if user.save
    puts "user #{x} created"
  else
    puts "user #{x} FAIL !!!"
  end
end

time.10 do |x|
  offer = Offer.new
  offer.label = Faker::Internet.email
  offer.description = "#{offer.label} comme au restaurant à votre domicile"
  offer.cuisine = CUISINES.sample
  offer.address = Faker::Address.full_address
  offer.km_perimeter = rand(1..50)
  offer.rate_per_guest = rand(15..35)
  offer.user_id = rand(1..20)
  if offer.save
    puts "offer #{x} created"
  else
    puts "offer #{x} FAIL !!!"
  end
end

time.2 do |x|
  reservation = Reservation.new
  reservation.address = Faker::Address.full_address
  reservation.date_time = Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default)
  reservation.guests_count = rand(1..8)
  resa.user_id = rand(1..20)
  resa.offer_id = rand(1..10)
  if reservation.save
    puts "reservation #{x} created"
  else
    puts "reservation #{x} FAIL !!!"
  end
end
