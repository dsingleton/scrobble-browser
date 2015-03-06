class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  has_many :tracks
end
