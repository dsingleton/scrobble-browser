class TracksController < ApplicationController
  def index
    @tracks = tracks.includes(:artist).paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.find(params[:id])
    @scrobbles = @track.scrobbles.recent.includes(:user, :track, :artist).limit(5)
    @users = @track.users.chart.limit(5)
  end

private

  def tracks
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @artist.tracks.joins(:scrobbles).chart
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @user.tracks.chart
    else
      Track.all.joins(:scrobbles).chart
    end
  end
end
