class TracksController < ApplicationController
  include NestableResource
  include FilterableResource

  def index
    @tracks = apply_filters(tracks.includes(:artist).chart)
    @tracks = @tracks.paginate(:page => params[:page])

  end

  def show
    @artist = Artist.find(params[:artist_id])
    @track = @artist.tracks.find(params[:id])
  end

private

  def tracks
    case @resource
    when Artist
      @resource.tracks.joins(:scrobbles)
    when User
      @resource.tracks
    else
      Track.all.joins(:scrobbles)
    end
  end
end
