class RecommendationsController < ApplicationController
  def new
  end

  def create
    mood = params[:mood]
    cuisine = params[:cuisine]

    conn = Faraday.new('https://beet-farmer.herokuapp.com/') do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{current_user.token}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)[:data]

    moods = parsed_response[:mood][:playlists].map do |playlist_data|
      Playlist.new(playlist_data)
    end

    cuisines = parsed_response[:cuisine][:playlists].map do |playlist_data|
      Playlist.new(playlist_data)
    end

    combos = parsed_response[:combos][:playlists].map do |playlist_data|
      Playlist.new(playlist_data)
    end

    # render locals: {
    #   recommendations: RecommendationFacade.new(params)
    # }

    redirect_to recommendations_path
  end
end
