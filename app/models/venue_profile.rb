class VenueProfile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :type_of_location, presence: true
  validates :capacity, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: 'Code postal invalide' }
  has_many :performances, dependent: :destroy
  has_one_attached :venuepict, dependent: :destroy
  validate :venuepict_format

  def resize_image
    resized_image = MiniMagick::Image.read(venuepict.download)
    resized_image = resized_image.resize '500x500'
    v_filename = venuepict.filename
    v_content_type = venuepict.content_type
    venuepict.purge
    venuepict.attach(io: File.open(resized_image.path), filename: v_filename, content_type: v_content_type)
  end

  def zip_city
    self.zipcode.byteslice(0,2)
  end

  def description_display
    if self.description.length < 90
      self.description
    else
      self.description.byteslice(0, 87)+"..."
    end
  end

  private

  def venuepict_format
    return unless venuepict.attached?
    if venuepict.blob.content_type.start_with? 'image/'
      if venuepict.blob.byte_size > 1.megabytes
        errors.add(:venuepict, 'size needs to be less than 1MB')
        venuepict.purge
      else
        resize_image
      end
    else
      venuepict.purge
      errors.add(:venuepict, 'needs to be an image')
    end
  end
end
