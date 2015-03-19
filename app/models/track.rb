class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :artist
  belongs_to :album
  has_many :scrobbles

  validates :name, presence: true, uniqueness: { scope: :artist, case_sensitive: false }

  scope :chart, -> {
    select('tracks.*, COUNT(1) AS plays')
    .joins(:scrobbles)
    .group('tracks.id')
    .order('plays DESC')
  }
end
