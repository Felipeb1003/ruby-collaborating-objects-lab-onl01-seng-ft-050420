require 'pry'
class Song
    attr_accessor :name, :artist
    @@all= []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all<<self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename)
        new_array = filename.split(" - ")
        song=new_array[1]
        artist=new_array[0]

            new_song = self.new(song)
            new_song.artist_name = artist
            new_song
    end

    def artist_name=(name)
        self.artist =Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end
