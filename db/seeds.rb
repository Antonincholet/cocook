require 'json'
require 'faker'

# seeds USERs avec FAKER
CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']
# Sauvegarde USERs
def save_user(user, city)
  if user.save
    puts "user #{user.full_name} from #{city} CREATED"
  else
    puts "user #{user.full_name} FAIL !!!"
  end
end
# création des 'User' Paris, Lyon, Marseille
# -- 'user' PARIS --
puts 'Create Users:'

userparis = User.new(email: 'userparis@mail.fr',
                     password: 'password',
                     full_name: Faker::FunnyName.name,
                     phone: Faker::PhoneNumber.phone_number)
save_user(userparis, 'Paris')
# -- 'user' LYON --

userlyon = User.new(email: 'userlyon@mail.fr',
                    password: 'password',
                    full_name: Faker::FunnyName.name,
                    phone: Faker::PhoneNumber.phone_number)
save_user(userlyon, 'Lyon')
# -- 'user' MARSEILLE --
usermarseille = User.new(email: 'usermarseille@mail.fr',
                         password: 'password',
                         full_name: Faker::FunnyName.name,
                         phone: Faker::PhoneNumber.phone_number)
save_user(usermarseille, 'Marseille')
# création des 'Chefs' Paris, Lyon, Marseille
# -- 'chef' PARIS --
chefparis = User.new(email: 'chefparis@mail.fr',
                     password: 'password',
                     full_name: Faker::FunnyName.name,
                     phone: Faker::PhoneNumber.phone_number)
save_user(chefparis, 'Paris')
# -- 'chef' LYON --
cheflyon = User.new(email: 'cheflyon@mail.fr',
                    password: 'password',
                    full_name: Faker::FunnyName.name,
                    phone: Faker::PhoneNumber.phone_number)
save_user(cheflyon, 'Lyon')
# -- 'chef' MARSEILLE --
chefmarseille = User.new(email: 'chefmarseille@mail.fr',
                         password: 'password',
                         full_name: Faker::FunnyName.name,
                         phone: Faker::PhoneNumber.phone_number)
save_user(chefmarseille, 'Marseille')

# seeds OFFERs avec parse JSON
# Parsing JSON
path = "./db/realseed.json"
serialized_seeds = File.read(path)
seeds = JSON.parse(serialized_seeds)
# Sauvegarde OFFERs
def save_offer(offer)
  if offer.save
    puts "Offer #{offer.label} at #{offer.address} CREATED"
  else
    puts "Offer #{offer.label} FAIL !!!"
  end
end
# création des Offres Paris, Lyon, Marseille
puts 'Create Offers:'
puts 'Create Offers from PARIS'
id = 5
while id > 0
    offerparis = Offer.new(label: Faker::Food.dish,
                           description: "Comme au restaurant à votre domicile",
                           cuisine: CUISINES.sample,
                           address: seeds[rand(0..4)]["place_name"],
                           km_perimeter: rand(5..50),
                           rate_per_guest: rand(5..55))

    offerparis.user = chefparis
    save_offer(offerparis)
    id -= 1
end
id = 5
puts 'Create Offers from LYON'
while id > 0
    offerlyon = Offer.new(label: Faker::Food.dish,
                          description: "Comme au restaurant à votre domicile",
                          cuisine: CUISINES.sample,
                          address: seeds[rand(5..9)]["place_name"],
                          km_perimeter: rand(5..50),
                          rate_per_guest: rand(5..55))

    offerlyon.user = cheflyon
    save_offer(offerlyon)
    id -= 1
end

puts 'Create Offers from MARSEILLE'
id = 5
while id > 0
    offermarseille = Offer.new(label: Faker::Food.dish,
                               description: "Comme au restaurant à votre domicile",
                               cuisine: CUISINES.sample,
                               address: seeds[rand(10..14)]["place_name"],
                               km_perimeter: rand(5..50),
                               rate_per_guest: rand(5..55))

    offermarseille.user = chefmarseille
    save_offer(offermarseille)
    id -= 1
end
# seeds RESERVATIONs
# Sauvegarde RESERVATIONs
def save_reservation(resa)
  if resa.save
    puts "Reservation at #{resa.address} CREATED"
  else
    puts "Reservation at #{resa.address} FAIL !!!"
  end
end
# création des Réservation Paris, Lyon, Marseille
puts 'Create Reservations:'
# création des Réservation Paris
resaparis = Reservation.new(address: seeds[4]["place_name"],
                            date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90, format: :default),
                            guests_count: rand(1..8))
resaparis.user = userparis
resaparis.offer = offerparis
save_reservation(resaparis)
# création des Réservation Lyon
resalyon = Reservation.new(address: seeds[9]["place_name"],
                           date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90, format: :default),
                           guests_count: rand(1..8))
resalyon.user = userlyon
resalyon.offer = offerlyon
save_reservation(resalyon)
# création des Réservation Marseille
resamarseille = Reservation.new(address: seeds[14]["place_name"],
                                date_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90, format: :default),
                                guests_count: rand(1..8))

resamarseille.user = usermarseille
resamarseille.offer = offermarseille
save_reservation(resamarseille)
