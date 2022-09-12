class ArtistpictsController < ApplicationController
  def create
    @profile = ArtistProfile.find(params[:artist_profile_id])
    @profile.artistpict.attach(params[:artistpict])
    redirect_to(artist_profile_path(@profile))
  end
end
