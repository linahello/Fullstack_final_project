class Performance < ApplicationRecord
  enum type_of_event: { public_event: 0, private_event: 1 }
  enum status: %i[available booked cancelled]
  belongs_to :venue_profile
  has_many :applications, dependent: :destroy
  has_many :artist_profiles, through: :applications
  has_many :performance_genres, dependent: :destroy
  has_many :genres, through: :performance_genres
end
