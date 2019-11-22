require 'pry'
class Artist
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
        song
    end

    def self.find_or_create_by_name(name)
        if self.all.select {|artist| artist.name == name}.count > 0
            self.all.find {|artist| artist.name == name}
        else
            Artist.new(name)
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

    def self.all
        @@all
    end


end