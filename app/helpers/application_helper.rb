module ApplicationHelper
  def build_chart(item, chart)
    pc = item.plays.to_f / chart.first.plays * 100
    content_tag :span, class: "bar", style: "width: #{pc}%" do
      number_with_delimiter(item.plays)
    end
  end
end
