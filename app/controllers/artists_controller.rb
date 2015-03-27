class ArtistsController < ApplicationController
  def index
    @artists = artists.chart.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end

private
  def artists
    resource = scoped_resource
    case resource
    when User
      resource.artists
    else
      Artist.all.joins(:scrobbles)
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
