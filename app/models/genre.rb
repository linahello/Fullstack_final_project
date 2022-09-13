class Genre < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :artist_profiles, through: :artist_genres
  has_many :performance_genres, dependent: :destroy
  has_many :performances, through: :performance_genres
end
