class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :finders

  belongs_to :artist
  belongs_to :album
end
