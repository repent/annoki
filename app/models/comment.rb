# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  discussion_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  content       :text
#  parent        :reference
#

class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :parent, class_name: Comment
  has_many :children, class_name: Comment, foreign_key: 'parent_id' #-> { where(parent: self) }, class_name: 'Comment'

  validates :parent_id, numericality: { only_integer: true, allow_nil: true }

  def self_with_children
    c = [ self ]
    self.children.each do |child|
      c += child.self_with_children
    end
    c
  end

  def depth # 0 = top level, 1 = has a top-level parent, etc
    return 0 if !parent
    parent.depth + 1
  end
end
