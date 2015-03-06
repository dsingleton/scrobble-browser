class AddArtistRefToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :artist
  end
end
