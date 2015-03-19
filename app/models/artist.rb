class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
  has_many :albums, -> { uniq }, through: :tracks
  has_many :scrobbles, through: :tracks

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :chart, -> {
    select('artists.*, COUNT(1) AS plays')
    .joins(:scrobbles)
    .group('artists.id')
    .order('plays DESC')
  }
end
