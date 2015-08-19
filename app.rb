require 'bundler'
Bundler.require

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../views', __FILE__)
  set :public, File.expand_path('../public', __FILE__)

## postgres adapter (TBD)

get '/' do
	erb :index
end

get '/3' do
	erb :three
end