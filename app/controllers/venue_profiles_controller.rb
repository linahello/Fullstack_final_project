class VenueProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @venue_profiles = VenueProfile.all
  end

  def show
    @venue_profile = find_venue_profile
  end

  def new; end

  def create
    @venue_profile = VenueProfile.new(venue_profile_params)
    @venue_profile.user_id = current_user.id
    if @venue_profile.save
      current_user.update(is_venue: true)
      redirect_to artist_profiles_path, success: 'Votre profil à bien été créé!'
    else
      redirect_to new_venue_profile_path, alert: 'Information manquante ou incorrecte'
    end
  end

  def update
    @venue_profile = find_venue_profile
    @venue_profile.update(venue_profile_params)
    redirect_to venue_profile_path(@venue_profile.id)
  end

  def edit
    @venue_profile = find_venue_profile
  end

  def destroy
    @venue_profile = find_venue_profile
    @venue_profile.destroy
    redirect_to root_path
  end

  private

  def venue_profile_params
    params.permit(:name, :description, :type_of_location, :capacity, :address, :zipcode, :city)
  end
end
