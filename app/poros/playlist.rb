class Playlist
  attr_reader :id, :name, :url

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @url = data[:url]
  end
end