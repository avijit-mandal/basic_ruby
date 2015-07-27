class Song
	MaxTime= 5*60
	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
	attr_reader :duration
	
	def Song.long(aSong)
		return aSong.duration > MaxTime
	end
	
	
end

s1= Song.new("abc", "xyz", 240)
Song.long(s1)
s2= Song.new("def", "uvw", 302)
Song.long(s2)