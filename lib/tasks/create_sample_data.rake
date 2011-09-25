namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    make_users
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
  end
end
