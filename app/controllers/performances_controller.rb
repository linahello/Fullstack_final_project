class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end

  def new
  end

  def create
    @performance = Performance.new(performance_params)
    @performance.venue_profile_id = current_user.venue_profile.id
    if @performance.save
      redirect_to dashboard_path, success: 'La performance à bien été créée!'
    else
      redirect_to new_performance_path, alert: 'Information manquante ou incorrecte'
    end
  end

  def edit
    @performance = find_performance
  end

  def update
    @performance = find_performance
    @performance.update(performance_params)
    redirect_to performance_path(@performance.id)
  end

  def destroy
    @performance = find_performance
    @performance.destroy
  end

  private

  def performance_params
    params.permit(:name, :description, :date, :duration, :type)
  end
end
