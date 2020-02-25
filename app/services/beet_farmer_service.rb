class BeetFarmerService
  attr_reader :token, :mood, :cuisine

  def initialize(token, mood, cuisine)
    @token = token
    @mood = mood
    @cuisine = cuisine
  end

  def recommendations
    response = conn.get("/api/v1/recommend?mood=#{mood}&cuisine=#{cuisine}&token=#{token}")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def conn
    Faraday.new('https://beet-farmer.herokuapp.com/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end