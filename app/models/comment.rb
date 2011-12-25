class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :body, :presence => true
  default_scope :order => 'created_at DESC'

  paginates_per 10
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  body       :text
#  user_id    :integer
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

