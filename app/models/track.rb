class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :artist
  belongs_to :album

  validates :name, presence: true, uniqueness: { scope: :artist, case_sensitive: false }
end
