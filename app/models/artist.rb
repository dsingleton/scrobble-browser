class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
  has_many :albums, -> { uniq }, through: :tracks

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
