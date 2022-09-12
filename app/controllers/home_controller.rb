class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.is_artist || current_user.is_venue
        redirect_to dashboard_path(current_user.id)
      else
        redirect_to profile_selection_show_path
      end
    end
  end
end
