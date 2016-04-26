# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  text_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Discussion < ActiveRecord::Base
  belongs_to :text
  has_many :comments
end
