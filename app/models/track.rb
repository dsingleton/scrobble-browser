require "erb"

class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :artist
  has_many :scrobbles
  has_many :users, -> { group(:user_id) }, through: :scrobbles

  validates :name, presence: true, uniqueness: { scope: :artist, case_sensitive: false }

  scope :alphabetized, -> { order('lower(name)') }
  scope :chart, -> {
    select('tracks.*, COUNT(1) AS plays')
    .group('tracks.id')
    .order('plays DESC')
  }

  def user_chart
    User.chart.where(:scrobbles => {track: Track.first})
  end

  def lastfm_link
    "#{artist.lastfm_link}/_/#{ERB::Util.url_encode(name)}"
  end
end
