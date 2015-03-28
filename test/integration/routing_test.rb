require 'test_helper'

class RoutingTest < ActionDispatch::IntegrationTest

  def assert_route(path, controller, action, params={})
    assert_routing({path: path, method: :get}, {controller: controller, action: action}.merge(params))
  end

  test 'home route' do
    assert_route('/', 'home', 'index')
  end

  test 'user routes' do
    assert_route('/users', 'users', 'index')
    assert_route('/users/username', 'users', 'show', id: 'username')

    assert_route('/users/username/artists', 'artists', 'index', user_id: 'username')
    assert_route('/users/username/tracks', 'tracks', 'index', user_id: 'username')
    assert_route('/users/username/scrobbles', 'scrobbles', 'index', user_id: 'username')
  end

  test 'artist routes' do
    assert_route('/artists', 'artists', 'index')
    assert_route('/artists/artist-name', 'artists', 'show', id: 'artist-name')

    assert_route('/artists/artist-name/users', 'users', 'index', artist_id: 'artist-name')
    assert_route('/artists/artist-name/tracks', 'tracks', 'index', artist_id: 'artist-name')
    assert_route('/artists/artist-name/scrobbles', 'scrobbles', 'index', artist_id: 'artist-name')

    assert_route('/artists/artist-name/tracks/track-name', 'tracks', 'show', artist_id: 'artist-name', id: 'track-name')
    assert_route('/artists/artist-name/tracks/track-name/users', 'users', 'index', artist_id: 'artist-name', track_id: 'track-name')
    assert_route('/artists/artist-name/tracks/track-name/scrobbles', 'scrobbles', 'index', artist_id: 'artist-name', track_id: 'track-name')
  end

  test 'track routes' do
    assert_route('/tracks', 'tracks', 'index')
  end

  test 'scrobble routes' do
    assert_route('/scrobbles', 'scrobbles', 'index')
  end

  test 'artist id route decoding' do
    assert_route('/artists/artist%20name', 'artists', 'show', id: 'artist name')
    assert_route('/artists/...artist%20name', 'artists', 'show', id: '...artist name')
    assert_route('/artists/a%23b', 'artists', 'show', id: 'a#b')

    # This fails, the `+` isn't unescaped :(
    # assert_route('/artists/artist+name', 'artists', 'show', id: 'artist name')
  end
end
