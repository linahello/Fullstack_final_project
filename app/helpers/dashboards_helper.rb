module DashboardsHelper
  def type_of_user
    if current_user.is_venue
      @performances = current_user.venue_profile.performances
    elsif current_user.is_artist
      @applications = current_user.artist_profile.applications
    end
  end
end
