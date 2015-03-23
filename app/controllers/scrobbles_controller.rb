class ScrobblesController < ApplicationController
  def index
    @scrobbles = Scrobble.recent.with_joins
    if params['user_id'] && @user = User.find(params['user_id'])
      @scrobbles = @scrobbles.by_user(@user)
    end
    @scrobbles = @scrobbles.paginate(:page => params[:page])
  end
end
