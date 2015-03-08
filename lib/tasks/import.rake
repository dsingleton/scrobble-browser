require "csv"
require "pry"

namespace :import do
  desc "Import a user's scrobbles from TSV (options: USERNAME=name PATH=path/to/scrobbles/tsv)"
  task from_tsv: :environment do

    username = ENV['USERNAME']
    tsv_filepath = ENV['PATH']

    user = User.find_or_create_by(username: username)
    field_names, *scrobbles = CSV.read(tsv_filepath, { :col_sep => "\t" })

    scrobbles.each do |scrobble|
      datetime, _, track, track_mbid, artist, artist_mbid, album, album_mbid, *_ = scrobble
      Scrobble.create(
        listened_at: datetime,
        user: user,
        track:Track.find_or_create_by(
          name: track,
          mbid: track_mbid,
          artist: Artist.find_or_create_by(
            name: artist,
            mbid: artist_mbid
          ),
          album: Album.find_or_create_by(
            name: album,
            mbid: album_mbid
          )
        )
      )
    end
  end
end