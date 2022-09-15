class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ArtistGenresHelper
  include ArtistProfilesHelper
  include VenueProfilesHelper
  include PerformancesHelper
  include DashboardsHelper
  include PerformanceGenresHelper
  include ApplicationsHelper
  include ConversationsHelper
  add_flash_types :info, :error, :success, :alert
end
