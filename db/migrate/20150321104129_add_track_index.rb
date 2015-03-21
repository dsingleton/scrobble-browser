class AddTrackIndex < ActiveRecord::Migration
  def change
    add_index :tracks, :artist_id
  end
end
