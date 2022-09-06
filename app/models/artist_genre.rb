class ArtistGenre < ApplicationRecord
  belongs_to :artist_profile
  belongs_to :genre
end
