class TracksController < ApplicationController
  before_action :artist

  def index
    @tracks = @artist.tracks.alphabetized
  end

  def show
    @track = @artist.tracks.find(params[:id])
    @scrobbles = @track.scrobbles.recent.includes(:user, :track, :artist).limit(5)
    @users = @track.users
  end

private

  def artist
    @artist = Artist.find(params[:artist_id])
  end
end
