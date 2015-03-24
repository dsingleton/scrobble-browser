class ArtistsController < ApplicationController
  def index
    @artists = Artist.alphabetized.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @scrobbles = @artist.scrobbles.recent.includes(:user, :track, :artist).limit(5)
  end
end
