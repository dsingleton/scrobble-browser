module ApplicationHelper
  def build_chart(item, chart)
    max_plays_on_page = chart.map(&:plays).max
    pc = item.plays.to_f / max_plays_on_page * 100

    content_tag :span, class: "bar", style: "width: #{pc}%" do
      number_with_delimiter(item.plays)
    end
  end
end
