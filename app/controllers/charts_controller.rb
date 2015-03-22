class ChartsController < ApplicationController
  def artist
    @artist_chart = filter(Artist.chart).limit(50)
  end

  def track
    @track_chart = filter(Track.chart).limit(50)
  end

private

  def filter(scrobbles)
    if params['id'] && @user = User.find(params['id'])
      scrobbles = scrobbles.where(scrobbles: {user: @user})
    end
    scrobbles
  end
end
