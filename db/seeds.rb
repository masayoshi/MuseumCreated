%w(MUSIC PHOTO DANCE FASHION MOVIE COMEDY ILLUSTRATION OTHER).each do |name|
  Genre.create(:name => name)
end
