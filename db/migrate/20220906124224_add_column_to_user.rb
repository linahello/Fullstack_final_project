class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_artist, :boolean, default: false
    add_column :users, :is_venue, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
  end
end
