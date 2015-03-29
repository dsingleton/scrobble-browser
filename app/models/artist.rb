require "erb"

class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
  has_many :scrobbles, through: :tracks
  has_many :users, through: :scrobbles

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :alphabetized, -> { reorder('lower(artists.name)') }
  scope :chart, -> {
    select('artists.*, COUNT(1) AS plays')
    .group('artists.id')
    .order('plays DESC')
  }

  def self.search_by_name(name)
    where('artists.name LIKE ?', "%#{name}%")
  end

  def lastfm_link
    "http://www.last.fm/music/#{ERB::Util.url_encode(name)}"
  end
end
