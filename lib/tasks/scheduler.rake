desc "This task is called by the Heroku scheduler add-on"
task :update_hatebu => :environment do
  puts "Updating Hatebu..."
  Article.fetch_hatena_bookmark
  puts "done."
end
