class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :artist
  has_many :scrobbles
  has_many :listeners, through: :scrobbles, source: :user

  validates :name, presence: true, uniqueness: { scope: :artist, case_sensitive: false }

  scope :chart, -> {
    select('tracks.*, COUNT(1) AS plays')
    .joins(:scrobbles)
    .includes(:artist)
    .group('tracks.id')
    .order('plays DESC')
  }

  def user_chart
    User.chart.where(:scrobbles => {track: Track.first})
  end
end
