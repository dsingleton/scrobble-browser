module TracksHelper
  def link_to_track(track)
    link_to track.name, [track.artist, track]
  end
end
