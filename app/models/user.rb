class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :finders

  validates :username, presence: true, uniqueness: true
end
