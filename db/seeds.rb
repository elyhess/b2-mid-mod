# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# pixar = Studio.create!(name: 'pixar', location: 'California')
a24 = Studio.create!(name: 'A24', location: 'New York')
# soul = pixar.movies.create!(name: 'Soul', year: "2020", genre: "Animated Comedy")
# cars = pixar.movies.create!(name: 'Cars', year: "2006", genre: "Animated Comedy")

midsommar = a24.movies.create!(title: "Midsommar", year: "2019", genre: "Psychological Thriller")
hereditary = a24.movies.create!(title: "Hereditary", year: "2018", genre: "Psychological Thriller")
the_lighthouse = a24.movies.create!(title: "The Lighthouse", year: "2019", genre: "Horror/Drama")

actor_1 = Actor.create!(name: "Amy", age: 24)
actor_2 = Actor.create!(name: "Bob", age: 43)
actor_3 = Actor.create!(name: "Carl", age: 16)
actor_4 = Actor.create!(name: "Deandra", age: 33)

MovieActor.create!(movie: midsommar, actor: actor_1)
MovieActor.create!(movie: midsommar, actor: actor_2)
MovieActor.create!(movie: midsommar, actor: actor_3)
MovieActor.create!(movie: hereditary, actor: actor_3)
MovieActor.create!(movie: the_lighthouse, actor: actor_3)
MovieActor.create!(movie: the_lighthouse, actor: actor_1)
MovieActor.create!(movie: the_lighthouse, actor: actor_4)
