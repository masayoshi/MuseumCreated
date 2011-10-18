class Feed < ActiveRecord::Base
  belongs_to :user
  
  validates :url, :format => {:with => URI::regexp(%w(http https))}, :presence => true
  validates :user_id, :presence => true

  after_create :initial_import
  
  def initial_import
    return unless ( feed = Feedzirra::Feed.fetch_and_parse(url))
    self.title = feed.title
    self.updated_at = Time.now
    save!
    
    add_entries(feed.entries)
  end

  def import_from_feed
    feed = Feedzirra::Feed.fetch_and_parse(url)
    add_entries(feed.entries)
  end

  private
  
  def add_entries(entries)
    entries.each do |entry|
      unless Work.exists? :url => entry.url
        self.user.works.create!(:title => entry.title,
                                :url => entry.url,
                                :description => entry.content )
      end
    end
  end

end
# == Schema Information
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  user_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

