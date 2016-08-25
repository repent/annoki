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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
