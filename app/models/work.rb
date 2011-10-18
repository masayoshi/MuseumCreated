class Work < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  validates :url, :format => {:with => URI::regexp(%w(http https))},:allow_blank => true
  validates :summary, :length => { :maximum => 100 }
  validates :description, :length => { :maximum => 1000 }
  validates :user_id, :presence => true

  acts_as_taggable
  paginates_per 10

  scope :created_by, lambda { |artist_username|
    where(user_id: User.find_by_username(artist_username)) if artist_username.present?
  }

  scope :all_or_tagged_with, lambda { |tag|
    tagged_with(tag) if tag.present?
  }

  scope :refine_search, lambda{ |search_params|
    created_by(search_params[:username]).
    all_or_tagged_with(search_params[:tag])
  }
  
end
# == Schema Information
#
# Table name: works
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  url         :string(255)
#  summary     :string(255)
#  description :text
#  user_id     :integer         not null
#  created_at  :datetime
#  updated_at  :datetime
#

