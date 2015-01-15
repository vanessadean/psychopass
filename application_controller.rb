require 'bundler'
Bundler.require
require 'json'
require 'net/http'
require './models/giph'

class App < Sinatra::Base

  get '/' do
    giphy = Giph.new('http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC')
    @tag = giphy.random_tag
    @image = giphy.image_url
    erb :index
  end

end