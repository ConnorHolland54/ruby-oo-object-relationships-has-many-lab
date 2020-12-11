
class Artist
    attr_accessor :name
    
    @@artists = []
    
    def initialize(name)
        @name = name
        save
    end
    
    def save 
        @@artists << self
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        new_song = Song.new(name)
        new_song.artist = self
    end

    def self.song_count
        count = 0
        self.all.each do |artist|
            count += artist.songs.length
        end
        count
    end
    
    def self.all
        @@artists
    end
end