class TracksController < ApplicationController
  before_action :set_scoped_resource

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

  def set_scoped_resource
    @resource = scoped_resource
  end

  def scoped_resource
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
      else
        @artist
      end
    else
      nil
    end
  end
end
