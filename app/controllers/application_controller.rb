class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ArtistGenresHelper
  include ArtistProfilesHelper
  include VenueProfilesHelper
  include PerformancesHelper
  include DashboardsHelper
  include PerformanceGenresHelper
  include ConversationsHelper
  add_flash_types :info, :error, :success, :alert

  def authorize_venue
    if user_signed_in?
      redirect_to root_path unless current_user.is_venue
    else
      redirect_to new_user_session_path
    end
  end
end
