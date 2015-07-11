class ScrobbleImporter

  def import(user, scrobbles_data)
    scrobbles_data.each { |scrobble_data| import_scrobble(user, scrobble_data) }
  end

private

  def import_scrobble(user, scrobble_data)
    datetime, _, track, track_mbid, artist, artist_mbid, *_ = scrobble_data

    Scrobble.create!(
      listened_at: datetime,
      user: user,
      track: find_or_create_track(
        find_or_create_artist(artist, artist_mbid),
        track,
        track_mbid
      )
    )
  end

  def find_or_create_artist(name, mbid)
    Artist.where('lower(name) = ?', name.downcase).first_or_create(name: name, mbid: mbid)
  end

  def find_or_create_track(artist, name, mbid)
    Track.where('lower(name) = ?', name.downcase).where(artist: artist).first_or_create(name: name, artist: artist, mbid: mbid)
  end
end
