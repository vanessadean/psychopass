require 'bundler'
Bundler.require
require 'json'

class App < Sinatra::Base

  get '/' do
    uri = URI('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC')
    api_response = Net::HTTP.get(uri)
    hash = JSON.parse(api_response)
    tags = hash["data"]["tags"]
    new_tags = tags.collect { |tag| tag.split(" ") }.flatten
    @tag = new_tags.sample
    @image = hash["data"]["image_url"]
    erb :index
  end

end