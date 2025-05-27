require "bundler"
Bundler.require

Dotenv.load

require "./models/giph"

class App < Sinatra::Base
  get "/" do
    giphster = Giph.new
    @keyword = giphster.random_keyword
    @image = giphster.random_image(@keyword)
    @track_id = giphster.random_track(@keyword)
    erb :index
  end
end
