require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///music_images.db"

get '/' do
  redirect "/images"
end

get "/error" do
	erb :"sinatra/404page"
end

get "/Error" do
	redirect "/error"
end

# all images/home


get "/images" do
   @music_photos = MusicPhoto.all
	 erb :"sinatra/index"
end

get "/images/new" do 
	erb :"sinatra/new"
end

# create new route

post "/images" do
  puts params
	music_photo = MusicPhoto.new(params[:music_photo])
	if music_photo.save
		redirect "/images"
	else
		redirect "/error"
	end
end

# this is the update route

put '/images/:id' do
	@music_photo = MusicPhoto.find(params[:id])
	if @music_photo.update_attributes(params[:music_photo])
		redirect "/images"
	end
end

get '/images/:id' do
	@music_photo = MusicPhoto.find(params[:id])
	erb :"sinatra/show"
end

# this is the edit route

get '/images/:id/edit' do
	@music_photo = MusicPhoto.find(params[:id])
	erb :"sinatra/edit"
end

# this is the destoy route

delete '/images/:id' do
	@music_photo = MusicPhoto.find(params[:id])
	if @music_photo.destroy
		redirect '/images'
	else
		redirect '/images/:id'
	end
end



class MusicPhoto < ActiveRecord::Base

  
	def self.add_new_post(description, title)
		if description == "what happened"
			return false
		else
			@new_post = MusicPhoto.new
			@new_post.push(description)
			@new_post.push(title)
		end
	end

	
end






