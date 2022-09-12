class DashboardsController < ApplicationController
  before_action :authenticate_user! do
    redirect_to profile_selection_show_path unless has_profile?
  end
  def show
    if current_user.is_venue
      @performances = current_user.venue_profile.performances
    elsif current_user.is_artist
      @performances = current_user.artist_profile.performances
    end
  end
end
