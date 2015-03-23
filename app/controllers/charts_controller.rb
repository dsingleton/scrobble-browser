class ChartsController < ApplicationController
  def artist
    @artist_chart = filter(Artist.chart).limit(50)
  end

  def track
    @track_chart = filter(Track.chart).limit(50)
  end

  def user
    @user_chart = filter(User.chart).limit(50)
  end

private

  def filter(scrobbles)
    # Applies on user chart, eg /users/underpangs/tracks
    if params[:type] == 'user'
      @user = User.find(params[:id])
      scrobbles = scrobbles.merge(Scrobble.by_user(@user))
    end

    # Applies on artist chart, eg /artists/foals/tracks (or /users)
    # Doesn't work for /users due to artist not being in scope
    if params[:type] == 'artist'
      @artist = Artist.find(params[:id])
      scrobbles = scrobbles.where(artist: @artist)
    end

    # Applies on track chart, eg /artists/foals/balloons/tracks (or /users)
    if params[:type] == 'track'
      @artist = Artist.find(params[:artist_id])
      @track = @artist.tracks.find(params[:id])
      scrobbles = scrobbles.where(scrobbles: {track: @track})
    end

    # Totally general purpose
    if params[:year]
      @year = params[:year]
      scrobbles = scrobbles.merge(Scrobble.in_year(@year.to_i))
    end

    scrobbles
  end
end
