class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :performance
      t.references :artist_profile
      t.text :message
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
