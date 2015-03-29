class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :finders

  validates :username, presence: true, uniqueness: true

  has_many :scrobbles
  has_many :tracks, through: :scrobbles
  has_many :artists, through: :scrobbles

  scope :alphabetized, -> { reorder('lower(users.username)') }
  scope :chart, -> {
    select('users.*, COUNT(1) AS plays')
    .group('users.id')
    .order('plays DESC')
  }

  def self.search_by_name(name)
    where('users.username LIKE ?', "%#{name}%")
  end
end
