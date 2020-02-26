class RecommendationFacade
  attr_reader :token, :mood, :cuisine

  def initialize(params, token)
    @token = token
    @mood = params[:mood]
    @cuisine = params[:cuisine]
  end

  def mood_ids
    moods.map(&:id)
  end

  def cuisine_ids
    cuisines.map(&:id)
  end

  def combo_ids
    combos.map(&:id)
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
