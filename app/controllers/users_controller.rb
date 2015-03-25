class UsersController < ApplicationController
  def index
    @users = users.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

private

  def users
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
        @track.users.chart
      else
        @artist.users.chart
      end
    else
      User.joins(:scrobbles).chart
    end
  end
end
