module ArtistsHelper
  def link_to_artist(artist_username)
    link_to artist_username, "artists/#{artist_username}"
  end
end
