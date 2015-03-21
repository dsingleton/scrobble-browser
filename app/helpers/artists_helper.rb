module ArtistsHelper
  def link_to_artist(artist)
    link_to artist.name, artist
  end
end
