module ArtistGenresHelper

  def find_artist_genre(genre)
    ArtistGenre.where(genre_id: genre.id, artist_profile_id: current_user.artist_profile.id).first.id
  end
end
