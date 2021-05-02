class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    
    def slug
        name.downcase.gsub(" ", "-")
        #needs to be hyphenated, since spaces arent escaped in routes
    end

    def self.find_by_slug(slug)
        #binding.pry
        Artist.all.find {|artist| artist.slug == slug }
        #skips having to find the id
    end
end
