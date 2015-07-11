require 'test_helper'
require 'scrobble_importer'

class ScrobbleImporterTest < ActiveSupport::TestCase

  test "Importing scrobbles are created" do

    scrobble_data = [
      ['2015-03-08T14:13:00+00:00', 1425823980, 'Wildest Dreams', '598bc2a9-1a27-4f6a-a7cc-30649303edca', 'Taylor Swift', '20244d07-534f-4eff-b4d4-930878889970', '', '', '', '', '1989 (Deluxe)', '', '', 'spotify'],
    ]

    user = User.create(username: 'tester')

    importer = ScrobbleImporter.new
    importer.import(user, scrobble_data)

    scrobble = Scrobble.last

    assert_equal Time.at(1425823980), scrobble.listened_at
    assert_equal 'Taylor Swift', scrobble.artist.name
    assert_equal 'Wildest Dreams', scrobble.track.name
  end
end
