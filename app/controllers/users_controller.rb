class UsersController < ApplicationController
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    top_tracks = @spotify_user.top_tracks(limit: 50)
    @chosen_ones = top_tracks.sample(5)

    tracks_uris = []
    @chosen_ones.each do |track|
      tracks_uris << track.uri
    end

    player = RSpotify::Player.new(@spotify_user)
    player.play_tracks(nil, tracks_uris)
  end
end
