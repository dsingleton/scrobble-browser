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
      track: Track.find_or_create_by!(
        name: track,
        artist: Artist.find_or_create_by!(
          name: artist,
          mbid: artist_mbid
        )
      )
    )
  end
end
