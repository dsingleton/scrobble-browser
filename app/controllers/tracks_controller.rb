class TracksController < ApplicationController
  before_action :artist

  def index
    @tracks = @artist.tracks
  end

  def show
    @track = @artist.tracks.find(params[:id])
  end

private

  def artist
    @artist = Artist.find(params[:artist_id])
  end
end
