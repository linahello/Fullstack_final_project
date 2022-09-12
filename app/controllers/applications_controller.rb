class ApplicationsController < ApplicationController

  def new;end

  def create
    @application = Application.create(application_params)
  end

  def update
  end

  private

  def application_params
    params.permit(:message, :status)
  end



end
