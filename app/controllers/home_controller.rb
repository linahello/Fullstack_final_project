class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.is_artist
        redirect_to venue_profiles_path
      elsif current_user.is_venue
        redirect_to artist_profiles_path
      else
        redirect_to profile_selection_show_path
      end
    end
  end
end
