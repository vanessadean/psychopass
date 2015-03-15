require 'open-uri'
require 'nokogiri'

class Giph

  def initialize(api_call)
    uri = URI(api_call)
    api_response = Net::HTTP.get(uri)
    @giph_hash = JSON.parse(api_response)
  end

  #tags no longer available via Giphy API
  # def random_tag
  #   tags = @giph_hash["data"]["tags"]
  #   split_tags = tags.collect { |tag| tag.split(" ") }.flatten
  #   split_tags.sample
  # end

  def random_keyword
    html = open("http://www.randomlists.com/random-words")
    nokogiri_scrape = Nokogiri::HTML(html)
    nokogiri_scrape.css("#loading_result ol li").first.text
  end

  def image_url
    @giph_hash["data"]["image_url"]
  end

end

