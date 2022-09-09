class ArtistGenresController < ApplicationController
  def create
    ArtistGenre.create(artist_genre_params)
    redirect_to new_artist_genre_path
  end

  def destroy
    @artist_genre = ArtistGenre.find(params[:id])
    @artist_genre.destroy
    redirect_to new_artist_genre_path
  end

  private

  def artist_genre_params
    params.permit(:genre_id, :artist_profile_id)
  end

end
