class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    # # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"

    # # Create playlist in user's Spotify account
    # playlist = spotify_user.create_playlist!('my-awesome-playlist')

    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # playlist.add_tracks!(tracks)
    # playlist.tracks.first.name #=> "Somebody That I Used To Know"

    # # Access and modify user's music library
    # spotify_user.save_tracks!(tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(tracks)

    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)

    @country = spotify_user.country
    @email = spotify_user.email
    player = RSpotify::Player.new(spotify_user)
    # player.play_context("b0ed48be576ace19a0a18676ca629ccd26b9f9b7","spotify:album:1Je1IMUlBXcx1Fz0WE7oPT")
    # player.play_track(nil, "spotify:track:3y6e01poVQDru5OLUu8nhE")
    @top_tracks = spotify_user.top_tracks(limit: 50)
    @samples = @top_tracks.sample(10)
    @chosen_one = @top_tracks.sample
    player.play_track(nil, @chosen_one.uri)
  end
end

