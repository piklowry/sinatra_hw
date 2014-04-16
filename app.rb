require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///music_images.db"

# 				IMAGES = [
# 		{title: "Jimi Hendrix"       , url: "http://t1.gstatic.com/images?q=tbn:ANd9GcRaizGEeIk3WXaoGcs9VCFpEVq_wXbMR8nPSRKgv3-xl8aW6xtY0g"},
# 		{title: "Woodstock"          , url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSLWs6u_UkwdZ1MO4bf69xGcx1DXmjMlzFyDV8Lfjs99JLe4YGd"},
# 		{title: "Lynard Skynard"     , url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQL_8PEeZrH_DT4jZe1M5La3j6vUAA-TkU5CBG7IYqM-deVfNc_"},
# 		{title: "Jefferson Airplane" , url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTXjfsrm4EFB6QCeLZlsvSgO4UpRBc2Lg_VWvM5C99x4VyWugUG"},
# 		{title: "The Beatles"        , url: "http://www.vintageconcertposters.com/_main/api/gallery/images/287.jpg"},
# 		{title: "Iron Maden"         , url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcVdz2Pwgw_e0WNkQjTJonjXi7BSyA8IGRboZb1sPzFeJYrvGoAg"},
# 		{title: "Elvis Presley"      , url: "http://www.postercentral.com/Concert%20Posters/Posters'%20Genre%20pages/Personal%20Favorites/elvis_presley_concert_sign.png"},
# 		{title: "Otis Redding"       , url: "http://www.postercentral.com/Tour%20Blanks/otis_redding_old_poster.png"},
# 		{title: "Jefferson Airplane" , url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRV5rG0CtgA0sr6UICu7YSAAUZH8jvEzPmnru5je9WIDixk8dIFwQ"},
# 		{title: "The Clash"          , url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTgKUsFPfIrfu5z2PJ8MZaYN1YcUXusa0jRG7ky7GrronePAKMe"},
# 		{title: "The Doors"          , url: "http://ww1.prweb.com/prfiles/2012/12/20/10262943/gI_115034_doors_hilton.jpg"},
# 		{title: "Ray Charles"        , url: "http://media-cache-ec0.pinimg.com/736x/ea/3e/a1/ea3ea154c0ac6f6ca4182f0cfc6b00c2.jpg"},
# 		{title: "Peter Frampton"     , url: "http://p2.la-img.com/747/21373/7330715_1_l.jpg"},
# 		{title: "Tom Petty"          , url: "http://upload.wikimedia.org/wikipedia/en/thumb/9/9e/JW-2004-tompettyposter.jpg/220px-JW-2004-tompettyposter.jpg"},
# 		{title: "Ozzy Osbourne"      , url: "http://media-cache-ec0.pinimg.com/736x/f1/d7/27/f1d7273c5346a5dcbf7780116d8fd2b8.jpg"},
# 		{title: "Johnny Cash"        , url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTfKjkIA6yT_RCA7snRh6ajl5OeAfVs6ciIWY-MlecRqrpZoV-5HQ"},
# ]


get '/' do
  redirect "/images"
end

get "/error" do
	erb :"sinatra/404page"
end

get "/Error" do
	redirect "/error"
end


get "/images" do
   @new_title = MusicPhoto.all
	erb :"sinatra/index"
end

post "/images" do
	puts params
	@new_post = MusicPhoto.new
	@new_post.title = params[:title]
	@new_post.description = params[:description]
  # erb :"sinatra/index"
end

# get "/music_photos/:id" do
# 	@new_title = MusicPhoto.find(params[:id])
# 	erb :"sinatra/show"
# end

class MusicPhoto < ActiveRecord::Base


@@music_titles = []

	def self.music_titles
		@@music_titles
	end


	def self.add_to_do(description, title, picture)
		if description == "what happened"
			return false
		else
			@@music_titles.push(description)
			@@music_titles.push(title)
			@@music_titles.push(picture)
		
		end
	end

end

# delete '/music_photos/:id' do
# 	title = MusicPhoto.find(params[:id])
# 	if title.delete
# 		redirect '/sinatra'
# 	else
# 		redirect '/sinatra/:id'
# 	end
# end

# post "/images" do
# 	puts params
	
# 	title = params[:title]
# 	picture = params[:url]
# 	text = params[:description]

# 	if MusicPhoto.add_to_do(text, title, picture)
# 		redirect "/images"
# 	else
# 		redirect "/Error"
# 	end
# end

# get "/images" do
# 	@music_titles = MusicPhoto.music_titles
# 	@images = IMAGES
# 	erb :"sinatra/index"
# end

# get "/images/:index" do |index|
# 	@image = IMAGES[index]
# end





