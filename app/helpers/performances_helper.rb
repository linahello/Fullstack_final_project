module PerformancesHelper
  def find_performance
    Performance.find(params[:id])
  end

  def authorize_venue
    if user_signed_in?
      redirect_to root_path unless current_user.is_venue
    else
      redirect_to new_user_session_path
    end
  end

  def authorize_artist
    if user_signed_in?
      redirect_to root_path unless current_user.is_artist
    else
      redirect_to new_user_session_path
    end
  end
end
