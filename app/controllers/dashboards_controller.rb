class DashboardsController < ApplicationController
  before_action :authenticate_user! do
    redirect_to profile_selection_show_path unless has_profile?
  end
  def show
    type_of_user
  end
end
