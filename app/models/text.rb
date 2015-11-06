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
end
