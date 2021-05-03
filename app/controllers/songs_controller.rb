class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do
        # binding.pry # used to figure out we need to grab the genre_ids, not the genre name
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry # used to show that song.genres is nested, plus we have to account for multiple genres (classic alternative)
        # find_by_slug, because find defaults to id
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        # binding.pry # used to show where the artist is in params
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        redirect to "/songs/#{@song.slug}"
    end
end
