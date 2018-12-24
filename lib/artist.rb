
# The Artist class keeps track of its own Song instances in an array.
# All Artists are created with an empty array of Songs.
# The Artist can #add_song to its @songs array when that method is called.

class Artist

    attr_accessor :name, :songs, :all
    @@all = []

    def initialize(name)
        @name = name
        @songs = [] #array of songs for each instance
    end


    def self.all
        @@all
    end


    def add_song (song)
        @songs << song
        #called by the song instance, adds in that song instance
        #called inside the song method #artist_name=
        #after the song has been created, assigned a name
        #the song class checks to see if there is an artist associated with the song, and if there isnt' one, it asks the Artist class to create an artist instance
        #it then passes that artist instance back to the song to store as an attribute
        #the song class then calls this method #add_song
        #this method adds the song to the artist instances song array
        #every artist instance has this array
    end


    def save
        @@all << self
    end


    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.create(name)
    end

    def self.find(name)
        @@all.find do |artist|
            artist.name == name
        end
    end

    def self.create(name)
        artist = self.new(name)
        @@all << artist
        artist
    end


    def print_songs ()
        puts @songs.map {|song| song.name}
    end

end
