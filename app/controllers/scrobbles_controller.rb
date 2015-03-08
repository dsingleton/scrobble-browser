class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.paginate(:page => params[:page]).includes(:user, :track, :artist, :album).order(listened_at: :desc)
  end
end
