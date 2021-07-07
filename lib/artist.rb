require 'pry'
class Artist
  attr_accessor :name
  @@akk = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song|song.artist == self}
  end

  def add_song(song)
    #keeps track of an artist's songs
    song.artist = self
    song
  end

  def self.find_or_create_by_name(artist_given)
    #always returns an Artist instance
    #if artist name already exists, return it
    #if artist name does not exist, create it
    if Artist.all.select{|artist|artist.name == artist_given}.count > 0
      Artist.all.find {|artist|artist.name == artist_given}
    else
      Artist.new(artist_given)
    end
  end

  def print_songs
    #lists all of the artist's songs
    self.songs.each {|song|puts song.name}
  end

end