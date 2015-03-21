class Scrobble < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  has_one :artist, through: :track

  validates :user, :track, :listened_at, presence: true
end
