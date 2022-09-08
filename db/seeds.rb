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

for i in 1..40
  user = User.new
  user.email = "user#{i}@email.com"
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
end

for i in 1..20
  user = User.where(email: "user#{i}@email.com").first
  ArtistProfile.create(user_id: user.id, name: Faker::Music.band, description: Faker::Quote.most_interesting_man_in_the_world, zipcode: "#{rand(1..9)}#{rand(1..7)}#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}", city: Faker::Address.city)
end

ArtistProfile.all.each do |artist| 
  ArtistGenre.create(artist_profile_id: artist.id, genre_id: Genre.all.sample.id)
end

for i in 21..40
  user = User.where(email: "user#{i}@email.com").first
  types = [ 'Bar', 'Restaurant', 'Brasserie', 'Hotel', 'Cabaret', 'Musée', 'Salle de danse', 'Salle de spectacles', "Établissement d'enseignement", "Établissement sportifs", "Salle de culte" ]
  VenueProfile.create(user_id: user.id, name: Faker::Restaurant.name, description: Faker::Restaurant.description, type_of_location: types.sample, zipcode: "#{rand(1..9)}#{rand(1..7)}#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}", city: Faker::Address.city, address: Faker::Address.street_address, capacity: rand(30..1000))
end

ArtistProfile.all.each do |artist|
  artist.user.update(is_artist: true)
end

VenueProfile.all.each do |artist|
  artist.user.update(is_venue: true)
end