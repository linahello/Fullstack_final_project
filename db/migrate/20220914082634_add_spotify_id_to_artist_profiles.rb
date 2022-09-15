class AddSpotifyIdToArtistProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :artist_profiles, :spotifyID, :string
  end
end
