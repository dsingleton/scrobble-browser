class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.paginate(:page => params[:page]).order(listened_at: :desc)
  end
end
