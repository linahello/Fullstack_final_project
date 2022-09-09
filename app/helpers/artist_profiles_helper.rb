module ArtistProfilesHelper
  def find_artist_profile
    ArtistProfile.find(params[:id])
  end
end
