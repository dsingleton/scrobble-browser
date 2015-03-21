class ArtistsController < ApplicationController
  def index
    @artists = Artist.alphabetized.paginate(:page => params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
