class AlbumsController < ApplicationController
  before_action :artist

  def index
    @albums = @artist.albums
  end

  def show
    @album = @artist.albums.find(params[:id])
  end

private

  def artist
    @artist = Artist.find(params[:artist_id])
  end
end
