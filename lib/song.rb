
# The Song class can instantiate Songs with a @title. The Song class can assign an Artist instance to its @artist instance variable.
# The @artist variable assigned must be from the Artist class, not just a String.
# I can define a method within the Song class to turn a String into an Artist class.
# This can be achieved through a helper method called #artist_name=


class Song

    attr_accessor :artist, :name

    def initialize(name)
        @name = name
    end

    #this is a setter method, a writer,
    #it sets the artist attribute of the song instance equal to an artist instance (rather than just a string)
    #it calls a Class Method in Artist, that returns an artist object
    #the find_or_create_by_name either finds an existing artist and returns it, or creates a new object and returns it
    def artist_name=(name)
        song_artist = Artist.find_or_create_by_name(name)
        @artist = song_artist
        #after the artist instance is returned
        #this method calls the artist instance method #add_song
        #add_song adds this current song instance to the artist's song list
        @artist.add_song(self)
    end

    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        artist = filename.split(" - ")[0]
        song = self.new(song_name)
        #this is calling the #artist_name=
        #it is a writer method that assigns that variable to artist
        #you are not just assigning the string to artist,
        # because you want the artist attribute to be an artist instance instead
        song.artist_name = artist
        song
    end
end
