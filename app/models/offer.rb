# -*- coding: utf-8 -*-
class Offer < ActiveRecord::Base
  attr_accessible :offered_user_id, :title, :description, :status
  after_initialize :init

  belongs_to :offerer_user, :class_name => "User"
  belongs_to :offered_user, :class_name => "User"

  paginates_per 10

  UNEVALUATED = 0
  ACCEPTED = 1
  REJECTED = 2

  validates :title, :description, :status, :offerer_user_id, :offered_user_id, :presence => true

  scope :unevaluated, where("status = ?", UNEVALUATED)
  scope :accepted, where("status = ?", ACCEPTED)
  scope :rejected, where("status = ?", REJECTED)

  scope :status_in, lambda{ |status|
    if status.present? && (status =~ /^[0-9]+$/)
      case status.to_i
      when UNEVALUATED
        unevaluated
      when ACCEPTED
        accepted
      when REJECTED
        rejected
      end
    end
  }
  
  def accept!
    self.update_attribute(:status, ACCEPTED)
    project = Project.create!(:title => self.title, :description => self.description)
    project.users << self.offerer_user
    project.users << self.offered_user    
  end

  def reject!
    self.update_attribute(:status, REJECTED)
  end

  def accepted?
    return true if self.status == ACCEPTED
  end
  
  def rejected?
    return true if self.status == REJECTED
  end

  def unevaluated?
    return true if self.status == UNEVALUATED
  end

  private
  
  def init
    self.status ||= UNEVALUATED
  end
end
# == Schema Information
#
# Table name: offers
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  description     :text
#  status          :integer
#  offerer_user_id :integer
#  offered_user_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

