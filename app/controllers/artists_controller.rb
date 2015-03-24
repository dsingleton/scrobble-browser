class ArtistsController < ApplicationController
  def index
    @artists = Artist.all

    if params[:user_id]
      @user = User.find(params[:user_id])
      raise
      @artists = @user.artists.chart
    end

    @artists = @artists.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @scrobbles = @artist.scrobbles.recent.includes(:user, :track, :artist).limit(5)
  end
end
