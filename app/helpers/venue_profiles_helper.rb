module VenueProfilesHelper
  def find_venue_profile
    VenueProfile.find(params[:id])
  end
end
