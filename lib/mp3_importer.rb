

# The MP3Importer class finds a database of MP3 file names and parses the names of artists and songs from those files.
# This class works with Strings.
# It can send the Strings to the appropriate Artist/Song classes to make them into dynamic objects.
# The MP3Importer class uses the #import method to do this.

class MP3Importer

    attr_accessor :path

    def initialize (path)
        @path = path
    end

    #files gets called by #import and returns an array
    #files turns the files paths into a string
    #then removes the directory part of the string
    def files
        @files = Dir.glob("#{@path}/*.mp3").collect do |file|
            file.gsub("#{@path}/", "")
        end
    end

    # #import takes each normalized filename and sends it to the Song class #new_by_filename
      #which creates a new song instance for each of the filenames
    # #import calls #files
    #so it is calling the method on the MP3Importer instance
    # #import is collaborating with Song instances by calling a Song method (new_by_filename) which creates a new song for every item in the array
    def import
        imported_files = self.files
        imported_files.each do |file|
            new_song = Song.new_by_filename(file)
        end
    end
end
