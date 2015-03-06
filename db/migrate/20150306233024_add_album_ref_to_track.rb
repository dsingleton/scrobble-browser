class AddAlbumRefToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :album
  end
end
