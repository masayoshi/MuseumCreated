# == Schema Information
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  summary    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Article < ActiveRecord::Base
  validates :url, format: { with: URI::regexp(%w(http https)) }, presence: true, uniqueness: true
  validates :title, presence: true

  MUCRE_HATENA_BOOKMARK_FEED_URL = "http://b.hatena.ne.jp/mucre/rss"

  paginates_per 10

  default_scope order: 'created_at DESC'

  def self.fetch_hatena_bookmark
    return unless feed = Feedzirra::Feed.fetch_and_parse(MUCRE_HATENA_BOOKMARK_FEED_URL)
    feed.entries.each do |entry|
      unless self.exists? url: entry.url
        self.create(title: entry.title, url: entry.url, summary: entry.content)
      end
    end
  end
end
