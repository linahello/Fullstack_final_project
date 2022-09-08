class ArtistProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @artist_profiles = ArtistProfile.all
  end

  def show
    @artist_profile = find_artist_profile
  end

  def new; end

  def create
    @artist_profile = ArtistProfile.new(artist_profile_params)
    @artist_profile.user_id = current_user.id
    @artist_profile.save
    current_user.update(is_artist: true)
    redirect_to venue_profiles_path
  end

  def update
    @artist_profile = find_artist_profile
  end

  def edit
    @artist_profile = find_artist_profile
  end

  def destroy
    @artist_profile = find_artist_profile
    @artist_profile.destroy
    redirect_to root_path
  end

  private

  def artist_profile_params
    params.permit(:name, :description, :zipcode, :city)
  end
end
