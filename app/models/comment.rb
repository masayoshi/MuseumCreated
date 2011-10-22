class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :body, :presence => true
  default_scope :order => 'created_at DESC'

  paginates_per 10
end
