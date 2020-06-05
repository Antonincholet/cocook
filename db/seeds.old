require 'faker'

CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']

puts 'create user'

user = User.new(email: 'mail@mail.fr',
                password: 'password',
                full_name: Faker::FunnyName.name,
                phone: Faker::PhoneNumber.phone_number)
if user.save
  puts "user #{user.full_name} created"
else
  puts "user #{user.full_name} FAIL !!!"
end

chef = User.new(email: 'chef@mail.fr',
                password: 'password',
                full_name: Faker::FunnyName.name,
                phone: Faker::PhoneNumber.phone_number)
if chef.save
  puts "user #{chef.full_name} created"
else
  puts "user #{chef.full_name} FAIL !!!"
end

puts 'create offers:'

offer1 = Offer.new(
  label: Faker::Food.dish,
  description: "comme au restaurant à votre domicile",
  cuisine: CUISINES.sample,
  address: '167 rue paradis marseille',
  km_perimeter: rand(1..50),
  rate_per_guest: rand(15..35))
offer1.user = chef
if offer1.save
  puts "user #{offer1.label} created"
else
  puts "user #{offer1.label} FAIL !!!"
end

offer2 = Offer.new(
  label: Faker::Food.dish,
  description: "comme au restaurant à votre domicile",
  cuisine: CUISINES.sample,
  address: '90 boulevard de paris, marseille',
  km_perimeter: rand(1..50),
  rate_per_guest: rand(15..35))
offer2.user = chef
if offer2.save
  puts "user #{offer2.label} created"
else
  puts "user #{offer2.label} FAIL !!!"
end

offer3 = Offer.new(
  label: Faker::Food.dish,
  description: "comme au restaurant à votre domicile",
  cuisine: CUISINES.sample,
  address: '23 Rue Saint-Jean le Vieux, 84000 Avignon',
  km_perimeter: rand(1..50),
  rate_per_guest: rand(15..35))
offer3.user = chef
if offer3.save
  puts "user #{offer3.label} created"
else
  puts "user #{offer3.label} FAIL !!!"
end

offer4 = Offer.new(
  label: Faker::Food.dish,
  description: "comme au restaurant à votre domicile",
  cuisine: CUISINES.sample,
  address: '46 Rue Alexandre Dumas Paris',
  km_perimeter: rand(1..50),
  rate_per_guest: rand(15..35))
offer4.user = user
if offer4.save
  puts "user #{offer4.label} created"
else
  puts "user #{offer4.label} FAIL !!!"
end

offer5 = Offer.new(
  label: Faker::Food.dish,
  description: "comme au restaurant à votre domicile",
  cuisine: CUISINES.sample,
  address: '40 Avenue de la Bourdonnais Paris',
  km_perimeter: rand(1..50),
  rate_per_guest: rand(15..35))
offer5.user = user
if offer5.save
  puts "user #{offer5.label} created"
else
  puts "user #{offer5.label} FAIL !!!"
end



puts 'create reservations:'

reservation1 = Reservation.new(
  address: Faker::Address.full_address,
  date_time: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default),
  guests_count: rand(1..8))
reservation1.user = user
reservation1.offer = offer1
if reservation1.save
  puts "reservation #{reservation1} created"
else
  puts "reservation #{reservation1} FAIL !!!"
end

reservation2 = Reservation.new(
  address: Faker::Address.full_address,
  date_time: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default),
  guests_count: rand(1..8))
reservation2.user = user
reservation2.offer = offer2
if reservation1.save
  puts "reservation #{reservation2} created"
else
  puts "reservation #{reservation2} FAIL !!!"
end

reservation3 = Reservation.new(
  address: Faker::Address.full_address,
  date_time: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default),
  guests_count: rand(1..8))
reservation3.user = user
reservation3.offer = offer3
if reservation1.save
  puts "reservation #{reservation3} created"
else
  puts "reservation #{reservation3} FAIL !!!"
end

reservation4 = Reservation.new(
  address: Faker::Address.full_address,
  date_time: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default),
  guests_count: rand(1..8))
reservation4.user = chef
reservation4.offer = offer4
if reservation4.save
  puts "reservation #{reservation4} created"
else
  puts "reservation #{reservation4} FAIL !!!"
end

reservation5 = Reservation.new(
  address: Faker::Address.full_address,
  date_time: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now, format: :default),
  guests_count: rand(1..8))
reservation5.user = chef
reservation5.offer = offer5
if reservation5.save
  puts "reservation #{reservation5} created"
else
  puts "reservation #{reservation5} FAIL !!!"
end

