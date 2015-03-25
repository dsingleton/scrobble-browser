class ScrobblesController < ApplicationController
  def index
    @scrobbles = scrobbles.recent.includes(:user, :track, :artist).paginate(:page => params[:page])
  end

private
  def scrobbles
    if params[:user_id]
      @user = User.find(params[:user_id])
      @user.scrobbles
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
        @track.scrobbles
      else
        @artist.scrobbles
      end
    else
      Scrobble.all
    end
  end
end
