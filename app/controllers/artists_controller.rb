class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.joins(:scrobbles).chart

    if params[:user_id]
      @user = User.find(params[:user_id])
      @artists = @user.artists.select('artists.*, COUNT(1) AS plays').group('artists.id').order('plays DESC')
    end

    @artists = @artists.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @scrobbles = @artist.scrobbles.recent.includes(:user, :track, :artist).limit(5)
  end
end
