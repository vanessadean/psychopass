class Giph

  def initialize(api_call)
    uri = URI(api_call)
    api_response = Net::HTTP.get(uri)
    @giph_hash = JSON.parse(api_response)
  end

  def random_tag
    tags = @giph_hash["data"]["tags"]
    split_tags = tags.collect { |tag| tag.split(" ") }.flatten
    split_tags.sample
  end

  def image_url
    @giph_hash["data"]["image_url"]
  end

end