class Performance < ApplicationRecord
  enum type_of_event: { public_event: 0, private_event: 1 }
  enum status: %i[available booked cancelled]
  belongs_to :venue_profile
  has_many :applications, dependent: :destroy
  has_many :artist_profiles, through: :applications
  has_many :performance_genres, dependent: :destroy
  has_many :genres, through: :performance_genres

  def self.are_future
    performances = []
    Performance.all.each do |performance|
      if Time.now < performance.date
        performances.push(performance)
      end
    end
    performances
  end

  def date_time
    date.strftime("%d/%m/%Y à %H:%M")
  end

  def description_display
    if self.description.length < 90
      self.description
    else
      self.description.byteslice(0, 87)+"..."
    end
  end
end
