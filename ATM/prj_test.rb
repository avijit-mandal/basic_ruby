
require '/home/avijit/projects/ruby_programs/ATM/deposit.rb'
require '/home/avijit/projects/ruby_programs/ATM/withdraw.rb'

class Account
	@@balance=0
	def initialize(account_no)
		@account_no=account_no
	end
	attr_reader :account_no
	
	
def test(entry)
	if entry=="D" || entry=="d"
		
		deposit
		
	elsif entry=="W" || entry=="w"
		
		withdraw
		
	elsif entry=="B" || entry=="b"
		
		balance = File.open("#{@account_no}balance", &:gets)
		puts "\tYour account balance is Rs.#{balance}"
	
	elsif entry == 'Q'  || entry=="q"
		puts "\tThank you for using our service"
#		
	else
		puts "\tEnter a correct key D, W, B or Q"
	end
end

def user_input
	print "\tD)deposit W)ithdraw B)alance Q)uite :  "
	
	choice = gets
	entry = choice.strip
	test(entry)
	return if entry == 'Q'  || entry=="q"
	user_input
end

def text_ex
	if File.exist?("#{@account_no}balance")
		user_input
	else
				
		File.open("#{@account_no}balance", "w") do |aFile|
		aFile.puts "100"
		end
		user_input
	end
	
end

	

end

a=Account.new(100)
puts a.text_ex
	
