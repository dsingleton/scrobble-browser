class TracksController < ApplicationController
  include NestableResource

  def index
    @tracks = tracks.includes(:artist).chart.paginate(:page => params[:page])
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
