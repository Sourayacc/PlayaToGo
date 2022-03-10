# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Beach.destroy_all
User.destroy_all
new_user = User.create!(first_name: "Antoine",
                        last_name: "Camarasa",
                        email: "antoine.camarasa@gmail.com",
                        password: "password"
                      )
file = URI.open('https://www.tropicalement-votre.com/dests/maurice/trou-aux-biches-plage-maurice.jpg')
beach = Beach.create!(title: "Trou-aux-Biches",
            description: "Jolie Plage ensoleillée, avec des filaos qui donnent de l'ombre, on peut y trouver des tortues de mer",
            address: "Trou-aux-Biches, mauritius",
            price: "Rs8000",
            user: new_user)

beach.photo.attach(io: file, filename: 'trou-aux-biches-plage-maurice.jpg', content_type: 'image/jpg')
puts(beach.title, beach.user.first_name)

file = URI.open('https://www.mackoo.com/maurice/images/IMGP0278.jpg')
beach = Beach.create!(title: "Mont Choisy",
  description: "Plage mignonne, eau bien transparence, on peut y ramasser des coquillages",
  address: "mont choisy, mauritius",
  price: "Rs5000",
  user: new_user)
  puts(beach.title, beach.user.first_name)
  beach.photo.attach(io: file, filename: 'IMGP0278.jpg', content_type: 'image/jpg')

new_user = User.create!(first_name: "Souraya",
  last_name: "Cassam Chenai",
  email: "sourayacc@gmail.com",
  password: "password"
)

file = URI.open('https://previews.123rf.com/images/jbkrcmar/jbkrcmar1310/jbkrcmar131000065/23199321-playa-en-la-isla-mauricio-tamarin.jpg')
beach = Beach.create!(title: "Tamarin Bay",
description: "Jolie Plage plein d'ambiance, vendeur de boulettes et de glaçons râpés",
address: "route royale, Tamarin",
price: "Rs5000",
user: new_user)
puts(beach.title, beach.user.first_name)
beach.photo.attach(io: file, filename: '23199321-playa-en-la-isla-mauricio-tamarin.jpg', content_type: 'image/jpg')

file = URI.open('https://www.ile-maurice.fr/images/articles/2014/morne-paradis.jpg')
beach = Beach.create!(title: "Le Morne",
  description: "Grande et Jolie plage, plein d'ombres avec les filao",
  address: "Le morne, mauritius",
  price: "Rs10000",
  user: new_user)
  puts(beach.title, beach.user.first_name)
  beach.photo.attach(io: file, filename: 'morne-paradis.jpg', content_type: 'image/jpg')

booking = Booking.create!(starting_date: "10-03-2022", ending_date: "20-03-2022", user: new_user, beach: beach)
puts(booking)
