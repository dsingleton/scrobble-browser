class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :finders
end
