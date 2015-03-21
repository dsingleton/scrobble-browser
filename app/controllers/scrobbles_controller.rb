class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.paginate(:page => params[:page]).includes(:user, :track, :artist).order(listened_at: :desc)
  end
end
