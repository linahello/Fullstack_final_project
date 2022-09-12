class CreatePerformanceGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_genres do |t|
      t.references :performance
      t.references :genre

      t.timestamps
    end
  end
end
