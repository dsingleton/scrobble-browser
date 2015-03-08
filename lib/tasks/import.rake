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
      datetime, _, track, track_mbid, artist, artist_mbid, _, _, _, _, album, album_mbid, *_ = scrobble
      puts "#{artist} - #{track} (#{album})"

      begin
        Scrobble.create!(
          listened_at: datetime,
          user: user,
          track: Track.find_or_create_by!(
            name: track,
            mbid: track_mbid,
            artist: Artist.find_or_create_by!(
              name: artist,
              mbid: artist_mbid
            )
            ## Album disabled, DB model doesn't support a track on many albums
            # album: album.present? && Album.find_or_create_by!(
            #   name: album,
            #   mbid: album_mbid
            # )
          )
        )
      rescue => e
        binding.pry
      end
    end
  end
end
