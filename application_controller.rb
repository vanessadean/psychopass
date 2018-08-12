require 'bundler'
Bundler.require

Dotenv.load

require 'json'
require 'net/http'
require 'open-uri'

require './models/giph'

class App < Sinatra::Base
  get '/' do
    giphy = Giph.new
    @keyword = giphy.random_keyword
    @image = giphy.image_url
    @soundcloud_id = ENV['SOUNDCLOUD_ID']
    erb :index
  end
end
