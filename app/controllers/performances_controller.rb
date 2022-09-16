class PerformancesController < ApplicationController
  before_action :authorize_venue, only: %i[new create edit update destroy]
  before_action :authorize_artist, only: [:index]
  def index
    @performances = Performance.are_future
    @performances = Performance.are_future.select { |performance| performance.venue_profile.zip_city == search_params['dpt'] } if search_params['dpt'].present?
  end

  def new; end

  def create
    @performance = Performance.new(performance_params)
    @performance.venue_profile_id = current_user.venue_profile.id
    if @performance.save
      redirect_to new_performance_performance_genre_path(@performance.id), success: 'La performance à bien été créée!'
    else
      redirect_to new_performance_path, alert: 'Information manquante ou incorrecte'
    end
  end

  def edit
    @performance = find_performance
  end

  def show
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
    params.permit(:name, :description, :date, :duration, :type_of_event, :status)
  end

  def search_params
    params.slice(:dpt)
  end
end
