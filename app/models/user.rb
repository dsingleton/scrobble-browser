class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :finders

  validates :username, presence: true, uniqueness: true

  has_many :scrobbles
  has_many :tracks, through: :scrobbles
  has_many :artists, through: :scrobbles

  scope :chart, -> {
    select('users.*, COUNT(1) AS plays').group('users.id').order('plays DESC')
  }
end
