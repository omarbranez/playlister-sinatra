class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # find_by_slug, because find defaults to id
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find(params[:slug])
        #binding.pry
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.save
        redirect to "/songs/#{@song.slug}"
    end
end
