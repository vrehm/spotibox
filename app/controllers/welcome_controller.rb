class WelcomeController < ApplicationController
  def index
    artists = RSpotify::Artist.search('Dead Kennedys')

    @dead_kennedys = artists.first
    @albums = @dead_kennedys.albums
    @mtsc = @albums.first
    @tracks = @mtsc.tracks
    @c_u_a = @tracks.first
  end
end
