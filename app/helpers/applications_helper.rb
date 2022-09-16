module ApplicationsHelper
  def find_applications_all
    @applications = Application.where(performance_id: params[:id])
  end

  def find_application
    @application = Application.find(params[:id])
  end
end
