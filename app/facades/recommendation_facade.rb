class RecommendationFacade
  attr_reader :token, :mood, :cuisine

  def initialize(params, token)
    @token = token
    @mood = params[:mood]
    @cuisine = params[:cuisine]
  end

  def moods
    service.recommendations[:mood][:playlists].map do |playlist_hash|
      Playlist.new(playlist_hash)
    end
  end

  def cuisines
    service.recommendations[:cuisine][:playlists].map do |playlist_hash|
      Playlist.new(playlist_hash)
    end
  end

  def combos
    service.recommendations[:combos][:playlists].map do |playlist_hash|
      Playlist.new(playlist_hash)
    end
  end

  def service
    return @service if @service
    @service = BeetFarmerService.new(@token, @mood, @cuisine)
  end
end