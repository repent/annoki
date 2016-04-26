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
  
  private
  def tag_para(html) # may contain tags, but not surrounding tags like <p>
    binding.pry
    html
    
    #link_to "#{@n+=1}. #{html}"
  end
  def markdown(text)
    @html_options ||= { hard_wrap: true, filter_html: true, autolink: true }
    @redcarpet_options ||= { footnotes: true }
    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(@html_options), @redcarpet_options)
    @md.render(text).html_safe
  end
end
