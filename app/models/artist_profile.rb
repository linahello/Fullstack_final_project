class ArtistProfile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: 'Code postal invalide' }
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres
  has_many :applications, dependent: :destroy
  has_many :performances, through: :applications
  has_one_attached :artistpict, dependent: :destroy
  validate :artistpict_format
  before_save :find_spotifyid

  def resize_image
    resized_image = MiniMagick::Image.read(artistpict.download)
    resized_image = resized_image.resize '500x500'
    v_filename = artistpict.filename
    v_content_type = artistpict.content_type
    artistpict.purge
    artistpict.attach(io: File.open(resized_image.path), filename: v_filename, content_type: v_content_type)
  end

  def description_display
    if self.description.length < 90
      self.description
    else
      self.description.byteslice(0, 87)+"..."
    end
  end

  def zip_city
    zipcode.byteslice(0,2)
  end

  def find_spotifyid
    return unless self.spotifyID
      self.spotifyID = self.spotifyID.split('/').last
      begin
        RSpotify::Artist.find(self.spotifyID)
      rescue => e
        self.spotifyID = nil
      end
  end

  private

  def artistpict_format
    return unless artistpict.attached?
    if artistpict.blob.content_type.start_with? 'image/'
      if artistpict.blob.byte_size > 5.megabytes
        errors.add(:artistpict, "La taille de l'image doit être inférieure à 5MB")
        artistpict.purge
      else
        resize_image
      end
    else
      artistpict.purge
      errors.add(:artistpict, 'doit être un image')
    end
  end
end
