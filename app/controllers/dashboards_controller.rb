class DashboardsController < ApplicationController
  def show
    if current_user.is_venue
      @performances = current_user.venue_profile.performances
    elsif current_user.is_artist
      @performances = current_user.artist_profile.performances
    end
  end
end
