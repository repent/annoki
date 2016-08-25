# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  text_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :integer
#

class Discussion < ActiveRecord::Base
  belongs_to :text
  has_many :comments
  
  def each_comment_chronological
    comments.each { |c| yield c }
  end

  def each_comment # logical order
    all_comments = []
    comments.where(parent: nil).each do |comment|
      all_comments += comment.self_with_children
    end
    binding.pry
    all_comments.each { |comment| yield comment }
  end

  def extract
    text[location]
  end
end
