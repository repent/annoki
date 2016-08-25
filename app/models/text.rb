# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  name       :string
#  content    :text
#  author     :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Text < ActiveRecord::Base
  has_many :discussions, dependent: :destroy
  #before_destroy :ensure_not_referenced_by_any_discussion
  
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::SanitizeHelper
  #include ActionView::Helpers::AssetTagHelper #
  
  delegate :url_helpers, to: 'Rails.application.routes'
  
  def rich_content
    #doc = Nokogiri::HTML(html)
    frag = Nokogiri::HTML.fragment(markdown(content))
    @n=0
    
    frag.elements.each do |e|
      #binding.pry
      case e.name
        when 'p', 'h1'
          e.inner_html = tag_para(e.inner_html)
        when 'ol', 'blockquote'
          e.children.each do |c|
            case c.name
              when 'li', 'p'
                c.inner_html = tag_para(c.inner_html)
              else
                puts "Unhandled #{c.name}"
            end
          end
          #binding.pry
        else
          puts "Unhandled #{e.name}"
      end
    end
    
    #doc.search("//pre[@lang]").each do |pre|
    #  pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    #end
    #doc.to_s
    #output=''
    #
    #doc.css('p').each do |link|
    #  output += link.content
    #end
    #output
    #binding.pry
    frag.to_html.html_safe
  end
  
  def [](i)
    # Access nth element like an array
    #raise unless i.class == Fixnum
    each do |p|
      return p.to_html.html_safe if i == 1
      i -= 1
    end
    nil
  end
  
  def each # returns nokogiri xml elements
    frag = Nokogiri::HTML.fragment(markdown(content))
    frag.elements.each { |e| yield e }
  end

  def plain_content(length)
    text = length ? content.truncate(length, separator: ' ') : content
    strip_tags markdown(text)
  end
  
  private
  def tag_para(html) # may contain tags, but not surrounding tags like <p>
    # Super-simple: no link
    #html

    # Simple style: new comment form
    #link_to html, url_helpers.new_comment_path( data: { text_id: self, paragraph: @n+=1 } )

    # Complex style: show discussion (which will include ability to comment)
    # BUT ids are needed to create a valid route to show
    #link_to html, url_helpers.discussion_path( data: { text_id: self, paragraph: @n+=1 } )

    # Hardcore: create dicussions that don't exist to get ids
    link_to html, url_helpers.discussion_path(
      Discussion.where( text_id: self, location: @n+=1 ).first_or_create )
  end
  def markdown(text)
    @html_options ||= { hard_wrap: true, filter_html: true, autolink: true }
    @redcarpet_options ||= { footnotes: true }
    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(@html_options), @redcarpet_options)
    @md.render(text).html_safe
  end
end
