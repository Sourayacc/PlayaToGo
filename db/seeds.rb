# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beach.destroy_all
User.destroy.all
new_user = User.create!(first_name: "Antoine",
                        last_name: "Camarasa",
                        email: "antoine.camarasa@gmail.com",
                        password: "antoine@camarasa86"
                      )
puts(new_user.first_name)
beach = Beach.create!(title: "Trou aux biches",
            description: "Jolie Plage ensoleillée, avec des filaos qui donnent de l'ombre, on peut y trouver des tortues de mer",
            address: "route royale, Trou au Biches",
            price: "Rs8000",
            user: new_user)
puts(beach.title, beach.user.first_name)

new_user = User.create!(first_name: "Souraya",
  last_name: "Cassam Chenai",
  email: "souraya.cassam_chenai@gmail.com",
  password: "souraya@"
)
puts(new_user.first_name)
beach = Beach.create!(title: "Trou aux biches",
description: "Jolie Plage ensoleillée, avec des filaos qui donnent de l'ombre, on peut y trouver des tortues de mer",
address: "route royale, Trou au Biches",
price: "Rs8000",
user: new_user)
puts(beach.title, beach.user.first_name)
