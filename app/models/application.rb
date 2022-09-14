class Application < ApplicationRecord
  enum status: %i[pending accepted declined]
  belongs_to :artist_profile
  belongs_to :performance
  after_save :email_venue_send

  def email_venue_send
  user = self.performance.venue_profile.user
  UserMailer.application_send(user).deliver_now
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
