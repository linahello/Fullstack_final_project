class VenueProfile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :type_of_location, presence: true
  validates :capacity, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: 'Code postal invalide' }
end
