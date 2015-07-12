require 'test_helper'
require 'scrobble_importer'

class ScrobbleImporterTest < ActiveSupport::TestCase

  test "Importing scrobbles are created" do

    scrobble_data = [
      ['2015-03-08T14:13:00+00:00', 1425823980, 'Wildest Dreams', '598bc2a9-1a27-4f6a-a7cc-30649303edca', 'Taylor Swift', '20244d07-534f-4eff-b4d4-930878889970', '', '', '', '', '1989 (Deluxe)', '', '', 'spotify'],
      ['2015-03-08T14:17:00+00:00', 1425824220, 'wildest dreams', 'c98bc2a9-1a27-4f6a-a7cc-30649303edca', 'TAYLOR SWIFT', 'a0244d07-534f-4eff-b4d4-930878889970', '', '', '', '', '1989 (Deluxe)', '', '', 'spotify'],
    ]

    user = User.create(username: 'tester')

    importer = ScrobbleImporter.new
    importer.import(user, scrobble_data)

    first_scrobble, second_scrobble = Scrobble.last(2)

    assert_equal Time.at(1425823980), first_scrobble.listened_at
    assert_equal 'Taylor Swift', first_scrobble.artist.name
    assert_equal '20244d07-534f-4eff-b4d4-930878889970', first_scrobble.artist.mbid
    assert_equal 'Wildest Dreams', first_scrobble.track.name
    assert_equal '598bc2a9-1a27-4f6a-a7cc-30649303edca', first_scrobble.track.mbid

    assert_equal Time.at(1425824220), second_scrobble.listened_at
    assert_equal 'Taylor Swift', second_scrobble.artist.name
    assert_equal '20244d07-534f-4eff-b4d4-930878889970', first_scrobble.artist.mbid
    assert_equal 'Wildest Dreams', second_scrobble.track.name
    assert_equal '598bc2a9-1a27-4f6a-a7cc-30649303edca', first_scrobble.track.mbid
  end

end
