require 'test_helper'

class ArtistsHelperTest < ActionView::TestCase
  test 'link_to_artist builds a link to an artist' do
    artist = Artist.first
    assert_equal link_to(artist.name, artist), link_to_artist(artist)
  end
end
