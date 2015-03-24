class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.all

    if params[:user_id]
      @user = User.find(params[:user_id])
      @scrobbles = @user.scrobbles
    end

    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
        @scrobbles = @track.scrobbles
      else
        @scrobbles = @artist.scrobbles
      end
    end

    @scrobbles = @scrobbles.recent.includes(:user, :track, :artist).paginate(:page => params[:page])
  end
end
