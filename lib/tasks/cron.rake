task :cron => :environment do
  Feed.all.each do |feed|
    feed.import_from_feed
  end
end
