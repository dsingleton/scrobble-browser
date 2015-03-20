class ChartsController < ApplicationController
  def artist
    @artist_chart = Artist.chart.limit(50)
  end

  def track
    @track_chart = Track.chart.limit(50)
  end
end
