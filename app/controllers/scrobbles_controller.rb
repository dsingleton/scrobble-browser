class ScrobblesController < ApplicationController
  include NestableResource
  include FilterableResource

  def index
    @scrobbles = apply_filters(scrobbles.recent.includes(:user, :track, :artist))
    @scrobbles = @scrobbles.paginate(:page => params[:page])
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
