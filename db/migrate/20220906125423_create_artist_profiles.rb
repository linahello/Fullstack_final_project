class CreateArtistProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_profiles do |t|
      t.string :name
      t.text :description
      t.string :zipcode
      t.string :city
      t.belongs_to :user

      t.timestamps
    end
  end
end
