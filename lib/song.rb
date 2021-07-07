class Song
    @@all = []
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)      
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        new_song = filename.split(" - ")
        Artist.find_or_create_by_name(new_song[0]).add_song(Song.new(new_song[1]))
    end
end