class ArtistGenresController < ApplicationController
  def create
    ArtistGenre.create(artist_genre_params)
  
    respond_to do |format|
      format.html {redirect_to new_artist_genre_path}
      format.js { }
    end
  end

  def destroy
    @artist_genre = ArtistGenre.find(params[:id])
    @artist_genre.destroy

    respond_to do |format|
      format.html {redirect_to new_artist_genre_path}
      format.js { }
    end
  end

  private

  def artist_genre_params
    params.permit(:genre_id, :artist_profile_id)
  end

end
