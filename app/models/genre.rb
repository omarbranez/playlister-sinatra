class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    #song_genres table allows many-many relationshhip between them
    has_many :artists, through: :songs

    def slug
        name.downcase.gsub(" ", "-")
        #needs to be hyphenated, since spaces arent escaped in routes
    end

    def self.find_by_slug(slug)
        #binding.pry
        Genre.all.find {|genre| genre.slug == slug }
        #skips having to find the id
    end
end