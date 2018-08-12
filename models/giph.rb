class Giph
  def random_keyword
    wordnik_url = "http://api.wordnik.com/v4/words.json/randomWord?api_key=#{ENV['WORDNIK_API_KEY']}"
    uri = URI(wordnik_url)
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)['word']
  end

  def image_url
    giphy_url = "http://api.giphy.com/v1/gifs/translate?api_key=#{ENV['GIPHY_API_KEY']}"
    translate_call = giphy_url + "&s=#{random_keyword}"
    uri = URI(translate_call)
    api_response = Net::HTTP.get(uri)
    giph_object = JSON.parse(api_response)
    giph_object["data"]["images"]["original"]["url"]
  end
end

