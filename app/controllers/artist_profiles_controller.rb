class ArtistProfilesController < ApplicationController
  #before_action :authenticate_user!, :check_user #-> routes to the login / signup if not authenticated

  def index
  end

  def show
    @artist_profiles = User.find(params[:id])
  end

  def new
  end

  def create
    @artist_profiles = User.find(params[:id])
  end

  def update
    @artist_profiles = User.find(params[:id])
    edited_user = params[:user]
  end

  def edit
    @artist_profiles = User.find(params[:id])
  end

  def destroy
    @artist_profiles.destroy
    redirect_to root_path
  end
end
