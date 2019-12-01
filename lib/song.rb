class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name(artist_given)
    #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute

    self.artist = Artist.find_or_create_by_name(artist_given)
  end

  def self.new_by_filename(file)
    #associates new song instance with the artist from the filename
    #creates a new instance of a song from the file that's passed
    new_song = Song.new(file)
    new_song.artist = file.artist

  end


end