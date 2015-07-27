class Song
	def initialize (name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
	attr_reader :name, :artist, :duration
end

class Song
	def duration_minute
		@duration/60.0
	end
	def duration_minute=(value)
		@duration=(value*60).to_i
	end
	
end



a=Song.new("dosti", "ram", 220)

puts a.duration

puts a.name

puts a.artist

puts a.duration_minute

a.duration_minute=a.duration_minute


puts a.duration
