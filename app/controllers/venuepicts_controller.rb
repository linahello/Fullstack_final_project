class VenuepictsController < ApplicationController
  def create
    @profile = VenueProfile.find(params[:venue_profile_id])
    @profile.venuepict.attach(params[:venuepict])
    redirect_to(venue_profile_path(@profile))
  end
end
