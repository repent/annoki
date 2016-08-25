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
  
  def each
    comments.each { |c| yield c }
  end
end
