class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.recent.with_joins.paginate(:page => params[:page])
  end
end
