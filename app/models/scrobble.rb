class Scrobble < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  has_one :artist, through: :track

  validates :user, :track, :listened_at, presence: true

  scope :recent, -> { order(listened_at: :desc) }

  def self.in_year(year)
    date = DateTime.new(year)
    self.in_range(date.beginning_of_year, date.end_of_year)
  end

  def self.in_range(from, to)
    where("listened_at >= ? and listened_at <= ?", from, to)
  end
end
