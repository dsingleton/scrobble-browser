module FilterableResource
  extend ActiveSupport::Concern

  def apply_filters(relation)
    filters.each { |param, filter|
      relation = filter.call(relation, filter_params[param]) if filter_params[param]
    }
    relation
  end

private

  def filter_params
    @filter_params ||= params.slice(*filters.keys).compact
  end

  def filters
    filters = {
      order: -> (relation, order) { relation.alphabetized },
      q: -> (relation, search_term) { relation.search_by_name(search_term) },
      min_plays: -> (relation, min_plays) { relation.merge(Scrobble.min_plays(min_plays.to_i)) },
      year: -> (relation, year) { relation.merge(Scrobble.in_year(year.to_i)) },
      before: -> (relation, before) { relation.merge(Scrobble.before(parse_date_param(before))) },
      after: -> (relation, after) { relation.merge(Scrobble.after(parse_date_param(after))) }
    }
    # raise
    filters.slice(:year, :before, :after) if self.class
  end

  def parse_date_param(date_param)
    Date.new(*date_param.split('-').map(&:to_i))
  end
end
