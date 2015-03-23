require "erb"

class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
  has_many :scrobbles, through: :tracks
  has_many :listeners, through: :scrobbles, source: :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :alphabetized, -> { order('lower(name)') }
  scope :chart, -> {
    select('artists.*, COUNT(1) AS plays')
    .joins(:scrobbles)
    .group('artists.id')
    .order('plays DESC')
  }

  def user_chart
    User.chart.where(:scrobbles => {track: Track.first})
  end

  def lastfm_link
    "http://www.last.fm/music/#{ERB::Util.url_encode(name)}"
  end
end
