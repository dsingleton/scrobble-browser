class ScrobblesController < ApplicationController
  include NestableResource

  def index
    @scrobbles = scrobbles.recent.includes(:user, :track, :artist).paginate(:page => params[:page])
  end

private
  def scrobbles
    if @resource
      @resource.scrobbles
    else
      Scrobble.all
    end
  end
end
