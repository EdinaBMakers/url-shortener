require 'sinatra/base'
require 'json'
require './lib/short_url_generator'

class UrlShortener < Sinatra::Base
  short_url_generator = ShortUrlGenerator.new

  post '/' do
    original_url = JSON.parse(request.body.read)["url"]
    short_url = short_url_generator.get_short_url

    JSON[{"short_url" => "/#{short_url}", "url" => original_url}]
  end

  get '/:short_url' do

  end
end