class Menu

	def choices(entry = '')
		print "D)deposite W)ithdraw B)alance Q)uite"
	  show_result(entry) unless entry == '' 
	end
	
	def show_result(entry)
		if entry=="D"
			"You are going to deposit"
		elsif entry=="W"
			print "its W"
		elsif entry=="B"
			print "its B"
		elsif entry != 'Q' 
			print "enter a correct key"
		end
	end

end

#Menu.new.choices('W')
