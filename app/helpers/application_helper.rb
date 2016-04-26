module ApplicationHelper
  def markdown(text)
    html_options = { hard_wrap: true, filter_html: true, autolink: true }
    redcarpet_options = { footnotes: true }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(html_options), redcarpet_options).render(text).html_safe
  end
end
