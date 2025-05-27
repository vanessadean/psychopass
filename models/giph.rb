require "json"
require "net/http"
require "open-uri"

class Giph
  def random_keyword
    word_url = "https://api.api-ninjas.com/v1/randomword"
    uri = URI(word_url)
    api_response = Net::HTTP.get(uri, {"X-Api-Key": ENV["NINJA_API_KEY"]})
    response = JSON.parse(api_response)
    response["word"][0] || "yo"
  end

  def random_track(word)
    music_url = "https://api.deezer.com/search/?q=track:'#{word}'"
    uri = URI(music_url)
    api_response = Net::HTTP.get(uri)
    response = JSON.parse(api_response)
    data = response["data"][0]
    data && data["id"] || ENV["DEFAULT_TRACK_ID"]
  end

  def random_image(word)
    giphy_url = "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&q=#{word}"
    uri = URI(giphy_url)
    api_response = Net::HTTP.get(uri)
    response = JSON.parse(api_response)
    data = response["data"][0]
    data && data["images"]["original"]["url"]
  end
end

