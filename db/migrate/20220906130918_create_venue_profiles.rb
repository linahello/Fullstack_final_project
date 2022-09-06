class CreateVenueProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_profiles do |t|
      t.string :name
      t.text :description
      t.string :type_of_location
      t.integer :capacity
      t.string :address
      t.string :zipcode
      t.string :city
      t.belongs_to :user

      t.timestamps
    end
  end
end
