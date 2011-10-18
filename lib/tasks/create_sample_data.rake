namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    make_users
    make_offers
  end
end

def make_users
  50.times do |n|
    email = "foobar#{n}@foo.bar"
    password  = "password"
    @tmp_user = User.new(:username => Faker::Name.first_name + n.to_s,
                             :email => email,
                             :password => password,
                             :password_confirmation => password)
    @tmp_user.skip_confirmation!
    @tmp_user.save!
    @tmp_user.update_attributes!(:name => Faker::Name.name,
                     :url => ("http://www." + Faker::Internet.domain_name),
                     :biography => Faker::Lorem.sentence(10),
                     :genre_id => rand(8)+1,
                     :interest_list => Faker::Lorem.words(10).join(','),
                     :skill_list => Faker::Lorem.words(10).join(','),
                     :area_list => Faker::Lorem.words(3).join(','),
                     :free_word_list => Faker::Lorem.words(10).join(','))

    10.times do
      @tmp_user.works.create(:title => Faker::Name.name,
                             :url => ("http://www." + Faker::Internet.domain_name),
                             :summary => Faker::Lorem.sentence(10),
                             :tag_list => Faker::Lorem.words(10).join(','),
                             :description => Faker::Lorem.sentence(20))
    end
  end
end

def make_offers
  user_num = User.all.count
  User.all.each do |user|
  20.times do
    user.offerings.create!(:title => Faker::Lorem.sentence(4),
                       :description => Faker::Lorem.sentence(10),
                       :status => rand(3),
                       :offered_user_id => rand(user_num))
  end
  end
end
