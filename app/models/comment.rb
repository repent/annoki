# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  discussion_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  content       :text
#

class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :parent, class_name: 'Comment'
end
