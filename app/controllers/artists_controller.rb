class ArtistsController < ApplicationController
        get '/artists' do
            @artists = Artist.all
            erb :'artists/index'
        end
    
        get '/artists/:slug' do
            @artist = Artist.find_by_slug(params[:slug])
            # binding.pry # used to find that @artist.songs is nested
            erb :'artists/show'
        end

end
