class ApplicationController < ActionController::Base
  include ArtistGenresHelper
  include ArtistProfilesHelper
  include VenueProfilesHelper
end
