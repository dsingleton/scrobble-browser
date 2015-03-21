class DropAlbums < ActiveRecord::Migration
  def up
    drop_table :albums
    remove_reference :tracks, :album
  end

  def down
    create_table :albums
    add_reference :tracks, :album
  end
end
