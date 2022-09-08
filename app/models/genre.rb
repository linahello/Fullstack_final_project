class Genre < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :artist_profiles, through: :artist_genres
end
