class Song
	def initialize (name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
end

class Song
	attr_reader :name, :artist, :duration
end


a=Song.new("dosti", "ram", 220)
puts a.duration
puts a.name
puts a.artist
