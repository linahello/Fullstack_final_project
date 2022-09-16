class PerformanceGenresController < ApplicationController

  def new
    @performance = Performance.find(params[:performance_id])
    @genres = Genre.all
  end

  def create
    PerformanceGenre.create(performance_genre_params)
    @performance = Performance.find(params[:performance_id])

    respond_to do |format|
      format.html { redirect_to new_performance_performance_genre_path(performance_id: @performance.id) }
      format.js {}
    end
  end

  def destroy
    @performance_genre = PerformanceGenre.find(params[:id])
    @performance_genre.destroy
    @performance = Performance.find(params[:performance_id])

    respond_to do |format|
      format.html { redirect_to new_performance_performance_genres_path(peformance_id: @performance.id) }
      format.js {}
    end
  end

  private

  def performance_genre_params
    params.permit(:genre_id, :performance_id)
  end
end
