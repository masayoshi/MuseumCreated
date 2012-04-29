class Location < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :latitude, :longitude, :note, :user_id
  geocoded_by :address
  validates :address, :latitude, :longitude, presence: true
  before_validation :geocode, if: :address_changed?
  acts_as_gmappable process_geocoding: false

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    result = "<h2>#{address}</h2>"
    result += "<p>#{note}</p><br>" if note.present?
    result += "<a href='/artists/#{self.user.username}'>#{self.user.username}</a>"
  end
end
