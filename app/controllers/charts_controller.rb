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
      scrobbles = scrobbles.merge(Scrobble.by_user(@user))
    end
    if params['year'] && @year = params['year']
      scrobbles = scrobbles.merge(Scrobble.in_year(@year.to_i))
    end
    scrobbles
  end
end
