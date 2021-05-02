class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name.downcase.gsub(" ", "-")
        #needs to be hyphenated, since spaces arent escaped in routes
    end

    def self.find_by_slug(slug)
        #binding.pry
        Song.all.find {|song| song.slug == slug }
        #skips having to find the id
    end
end 