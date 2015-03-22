class DropMbidFromTrack < ActiveRecord::Migration
  def change
    remove_column :tracks, :mbid
  end
end
