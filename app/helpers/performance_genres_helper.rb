module PerformanceGenresHelper
  def find_performance_genre(genre, performance)
    PerformanceGenre.where(genre_id: genre.id, performance_id: performance.id).first.id
  end
end
