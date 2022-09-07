# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create genres
list_genres = ["Afro", "Blues", "Bop", "Classique", "Country", "Dancehall", "Disco", "Electro", "Fado", "Flamenco", "Funk", "Gospel", "Hard rock", "Jazz", "Kompa", "Makossa", "Metal", "Musique latine", "New wave", "Pop", "Punk", "Musique alternative", "Rap", "Raï", "Reggae", "Rock'n'roll", "R'n'B", "Salsa", "Ska", "Soul", "Swing", "Zouk"]
list_genres.length.times do |idx|
  Genre.create(title: list_genres[idx])
end