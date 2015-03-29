class Scrobble < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  has_one :artist, through: :track

  validates :user, :track, :listened_at, presence: true

  scope :recent, -> { order(listened_at: :desc) }

  def self.min_plays(min_plays)
    having('COUNT(1) > ?', min_plays)
  end

  def self.in_year(year)
    date = DateTime.new(year)
    self.in_range(date.beginning_of_year, date.end_of_year)
  end

  def self.in_range(from, to)
    after(from).before(to)
  end

  def self.before(to_date)
    where("listened_at <= ?", to_date)
  end

  def self.after(from_date)
    where("listened_at >= ?", from_date)
  end
end
