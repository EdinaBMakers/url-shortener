require 'sinatra/base'
require 'json'
require './lib/short_url_generator'

class UrlShortener < Sinatra::Base
  short_url_generator = ShortUrlGenerator.new
  short_url_by_original_url = {}

  post '/' do
    original_url = JSON.parse(request.body.read)["url"]
    short_url = short_url_by_original_url[original_url]

    if short_url == nil
      short_url = short_url_generator.get_short_url
      short_url_by_original_url[original_url] = short_url
    end
    
    JSON[{"short_url" => "/#{short_url}", "url" => original_url}]
  end

  get '/:short_url' do

  end
end