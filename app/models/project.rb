class Project < ActiveRecord::Base
  attr_accessible :title, :description, :status
  after_initialize :init
  
  has_and_belongs_to_many :users
  has_many :comments
  paginates_per 10

  PRIVATE = 0
  PUBLIC = 1

  scope :private, where("status = ?", PRIVATE)
  scope :public, where("status = ?", PUBLIC)

  default_scope :order => 'created_at DESC'

  validates :title, :description, :status, :presence => true
  
  private
  
  def init
    self.status ||= PRIVATE
  end
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  status      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

