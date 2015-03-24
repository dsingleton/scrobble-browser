class UsersController < ApplicationController
  def index
    @users = User.joins(:scrobbles).chart

    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
        @users = @track.users.chart
      else
        @users = @artist.users.chart
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
