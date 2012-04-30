class Event < ActiveRecord::Base
  attr_accessible :address, :description, :end_time, :fee, :latitude, :longitude, :place, :start_time, :title, :url, :user_id
  attr_accessible :tag_list
  belongs_to :user
  geocoded_by :address
  validates :address, :end_time, :fee, :latitude, :longitude, :place, :start_time, :title,:user_id,  presence: true
  before_validation :geocode, if: :address_changed?
  acts_as_gmappable process_geocoding: false
  acts_as_taggable

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    result = "<h2>#{title}</h2>"
    result += "<p>#{description}</p><br>" if description.present?
    result += "<a href='/artists/#{self.user.username}'>#{self.user.username}</a>"
  end
end
