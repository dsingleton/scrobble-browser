class AddMbidToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :mbid, :string
  end
end
