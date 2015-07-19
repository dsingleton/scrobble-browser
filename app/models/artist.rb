require "erb"

class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
  has_many :scrobbles, through: :tracks
  has_many :users, through: :scrobbles

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :alphabetized, -> { order('lower(name)') }
  scope :chart, -> {
    select('artists.*, COUNT(1) AS plays')
    .group('artists.id')
    .order('plays DESC')
  }

  def self.find_by_name(name)
    self.where("lower(name) = lower(?)", name).first
  end

  def self.find_by_name!(name)
    self.find_by_name(name) or raise ActiveRecord::RecordNotFound
  end

  def lastfm_link
    "http://www.last.fm/music/#{ERB::Util.url_encode(name)}"
  end
end
