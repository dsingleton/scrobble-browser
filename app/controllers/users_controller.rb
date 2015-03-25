class UsersController < ApplicationController
  def index
    @users = users.chart.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

private

  def users
    resource = scoped_resource
    case resource
    when Artist
    when Track
      resource.users
    else
      User.joins(:scrobbles)
    end
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
