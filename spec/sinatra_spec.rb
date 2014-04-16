require 'rspec'
require './app.rb'

describe MusicPhotos do 
	it 'should not have a false entry' do
		MusicPhotos.music_titles.should_not be_empty
	end

	it 'should not equal what happened'
	 MusicPhotos.music_titles.should_not eq(nil)
end

describe PutPhoto do 
	it 'should have images' do
		IMAGES.music_titles.should_not be_empty
	end
end



