class ArtistsController < ApplicationController
  include ResourceScoped

  def index
    @artists = artists.chart.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @scrobbles = @artist.scrobbles.recent.includes(:user, :track, :artist).limit(5)
  end

private
  def artists
    if @resource
      @resource.artists
    else
      Artist.all.joins(:scrobbles)
    end
  end
end
