class ArtistsController < ApplicationController
  def index
    @artists = artists.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @scrobbles = @artist.scrobbles.recent.includes(:user, :track, :artist).limit(5)
  end

private
  def artists
    if params[:user_id]
      @user = User.find(params[:user_id])
      @user.artists.chart
    else
      Artist.all.joins(:scrobbles).chart
    end
  end
end
