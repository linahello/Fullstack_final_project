module PerformancesHelper
  def find_performance
    Performance.find(params[:id])
  end
end
