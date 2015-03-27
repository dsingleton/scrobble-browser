class ScrobblesController < ApplicationController
  def index
    @scrobbles = scrobbles.recent.includes(:user, :track, :artist).paginate(:page => params[:page])
  end

private
  def scrobbles
    resource = scoped_resource
    if resource
      resource.scrobbles
    else
      Scrobble.all
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
