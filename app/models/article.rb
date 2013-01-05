# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :title, :url, :summary
  validates :url, format: { with: URI::regexp(%w(http https)) }, presence: true, uniqueness: true
  validates :title, presence: true

  MUCRE_HATENA_BOOKMARK_FEED_URL = "http://b.hatena.ne.jp/mucre/rss"

  self.per_page = 10

  default_scope order: 'created_at DESC'
  scope :last_24hours, where("created_at >= ?", 1.days.ago)
  scope :search, lambda { |keyword|
    where 'title like :q or summary like :q', q: "%#{keyword}%"
  }

  def self.fetch_hatena_bookmark
    return unless feed = Feedzirra::Feed.fetch_and_parse(MUCRE_HATENA_BOOKMARK_FEED_URL)
    feed.entries.each do |entry|
      unless self.exists? url: entry.url
        self.create(title: entry.title, url: entry.url, summary: entry.content)
      end
    end
  end

  def self.random_in_a_day
    offset = rand(self.last_24hours.count)
    self.first(offset: offset)
  end
end
