class MP3Importer

    attr_accessor :path

    @@all = []

def initialize(path)
    @path = path
    @@all << self
end

def self.all
    @@all
end

#Need to go over these two methods. Not sure how they're working. 


def files
    @files ||= Dir["#{path}/*.mp3"]
    @files.collect {|file| file.gsub("#{path}/", "")}
end

def import
    self.files.each {|file| Song.new_by_filename(file)}
end




end