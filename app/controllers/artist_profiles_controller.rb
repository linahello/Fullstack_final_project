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
    if @artist_profile.save
      current_user.update(is_artist: true)
      redirect_to new_artist_genre_path, success: 'Votre profil à bien été créé!'
    else
      redirect_to new_artist_profile_path, alert: 'Information manquante ou incorrecte'
    end
  end

  def update
    @artist_profile = find_artist_profile
    @artist_profile.update(artist_profile_params)
    redirect_to artist_profile_path(@artist_profile.id)
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
