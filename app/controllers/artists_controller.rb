class ArtistsController < ApplicationController
  include NestableResource
  include FilterableResource

  def index
    @artists = apply_filters(artists.chart)
    @artists = @artists.paginate(:page => params[:page])
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
