class Scrobble < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  has_one :artist, through: :track

  validates :user, :track, :listened_at, presence: true

  scope :recent, -> { order(listened_at: :desc) }
  scope :with_joins, -> { includes(:user, :track, :artist) }
end
