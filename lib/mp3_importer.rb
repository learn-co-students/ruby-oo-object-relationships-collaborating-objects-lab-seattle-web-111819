class MP3Importer
  attr_accessor :path
  @@all = []

  def initialize(path)
    @path = path
    @@all <<self 
  end

  def self.all
    @@all
  end

  def files
  #  loads all the mp3 files in the path directory
  Dir[@path + "/*.mp3"].map {|file| file[@path.length + 1..-1]}
  end

  def import
    #imports the files into the library by creating songs from a filename
    self.files.each {|file| file.new_by_filename(file) }
  end
end