class ApplicationsController < ApplicationController

  def new
  end

  def create
   @application = Application.new(application_params)
  @application.update(artist_profile_id: current_user.artist_profile.id)
  @application.save!
  redirect_to dashboard_path(current_user.id)
  end

  def update
  end

  private 

  def application_params
    params.permit(:performance_id, :message)
  end


end
