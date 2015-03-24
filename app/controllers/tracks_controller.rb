class TracksController < ApplicationController

  def index
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @tracks = @artist.tracks.joins(:scrobbles).chart
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @tracks = @user.tracks.chart
    else
      @tracks = Track.all.joins(:scrobbles).chart
    end

    @tracks = @tracks.includes(:artist).paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.find(params[:id])
    @scrobbles = @track.scrobbles.recent.includes(:user, :track, :artist).limit(5)
    @users = @track.users
  end
end
