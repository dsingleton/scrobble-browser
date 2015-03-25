class ArtistsController < ApplicationController
  include NestableResource

  def index
    @artists = artists.chart.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
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
