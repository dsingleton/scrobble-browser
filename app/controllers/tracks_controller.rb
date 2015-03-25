class TracksController < ApplicationController
  include ResourceScoped

  def index
    @tracks = tracks.includes(:artist).chart.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.find(params[:id])
    @scrobbles = @track.scrobbles.recent.includes(:user, :track, :artist).limit(5)
    @users = @track.users.chart.limit(5)
  end

private

  def tracks
    case @resource
    when Artist
      @resource.tracks.joins(:scrobbles)
    when User
      @resource.tracks
    else
      Track.all.joins(:scrobbles)
    end
  end
end
