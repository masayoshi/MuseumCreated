desc "This task is called by the Heroku scheduler add-on"
task :update_hatebu => :environment do
  puts "Updating Hatebu..."
  Article.fetch_hatena_bookmark
  puts "done."
end
task :tweet_random_article => :environment do
  puts "Setup Twitter Client..."
  Twitter.configure do |config|
    config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
  end
  Twitter.gateway = ENV['APIGEE_TWITTER_API_ENDPOINT']
  article = Article.random_in_a_day
  Twitter.update(article.title + " " + article.url + " " + "http://museum-created.heroku.com/news")
  puts "done."
end
