source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'devise'
gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'kaminari'
gem 'acts-as-taggable-on'
gem 'gravatar_image_tag'

# For Heroku
group :production do
  gem 'pg'
  gem 'therubyracer-heroku'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'spork'
  gem 'rb-fsevent'
  gem 'guard-spork'
  gem 'growl' # MacOSの場合は設定する。growl、glowlnotifyをインストールする必要あり。
  gem 'annotate'
  gem 'faker'
  gem 'factory_girl_rails'
end
