class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.all.order(listened_at: :desc)
  end
end
