module ApplicationsHelper

  def find_application
    @application = Application.where(performance_id: params[:id])
  end
end
