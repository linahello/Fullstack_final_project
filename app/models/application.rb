class Application < ApplicationRecord
  enum status: %i[pending accepted declined]
  belongs_to :artist_profile
  belongs_to :performance
  after_create :email_venue_send

  def email_venue_send
    user = self.performance.venue_profile.user
    UserMailer.application_send(user, self).deliver_now
  end

  def email_artist_status
    user = self.artist_profile.user
    UserMailer.email_musician(user, self).deliver_now
  end

  def display_status
    case status
    when 'pending'
      'En attente'
    when 'accepted'
      'Acceptée'
    when 'declined'
      'Rejetée'
    end
  end
end
