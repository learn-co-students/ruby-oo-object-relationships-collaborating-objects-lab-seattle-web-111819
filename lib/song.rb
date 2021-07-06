class Song

    #have to add artist to the macros here so the Artist class can communicat with the Song class. 
    #Doesn't get added to the initialize method however.

    attr_accessor :name, :artist

    @@all = []

def initialize(name)
    @name = name
    @@all << self
end

def self.all
    @@all
end

#Need to go over these two methods. Not sure how they're working. 

def self.new_by_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song = file[1]
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
end

def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
end




end