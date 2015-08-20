require 'bundler'
Bundler.require

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../views', __FILE__)
  set :public, File.expand_path('../public', __FILE__)

## postgres adapter (TBD)
ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'instafake')

## EXERCISE FILES

get '/' do
	erb :index
end

get '/3' do
	erb :three
end

get '/4' do
	erb :four
end

get '/5' do
	erb :five
end

get '/6' do
	erb :six
end

get '/7' do
	erb :seven
end
get '/8' do
	erb :eight
end

## API FILES

## GET
get '/api/instafake' do
	InstagramModel.all.to_json
end
## GET BY ID
get '/api/instafake/:id' do
	InstagramModel.find(params[:id]).to_json
end
## CREATE
post '/api/instafake' do
	post_params = {:username => params[:username], :post => params[:post], :description => params[:description], :hashtags => params[:hashtags]}
	InstagramModel.create(post_params).to_json
end
## UPDATE
put '/api/instafake/:id' do
	InstagramModel.find(params[:id]).update(:username => params[:username], :post => params[:post], :description => params[:description], :hashtags => params[:hashtags]).to_json
end

patch '/api/instafake/:id' do
	InstagramModel.find(params[:id]).update(:username => params[:username], :post => params[:post], :description => params[:description], :hashtags => params[:hashtags]).to_json
end

## DELETE
delete '/api/instafake/:id' do
	InstagramModel.find(params[:id]).destroy.to_json	
end