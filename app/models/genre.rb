class Genre < ApplicationRecord
  has_many :artists_genres, dependent: :destroy
  has_many :artists_profiles, through: :artists_genres
end
