class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.integer :duration
      t.integer :type
      t.references :venue_profile
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
