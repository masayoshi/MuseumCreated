class Genre < ActiveRecord::Base
  has_many :users
  attr_readonly :name
end
# == Schema Information
#
# Table name: genres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

