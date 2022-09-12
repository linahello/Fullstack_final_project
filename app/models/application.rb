class Application < ApplicationRecord
  enum status: %i[pending accepted declined]
  belongs_to :artist_profile
  belongs_to :performance
end
