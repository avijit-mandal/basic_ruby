

def deposit
	balance = File.open("#{@account_no}balance", &:gets)

	print "\tEnter the amount you want to deposite:  "
	money= gets
	amount=money.to_i
	if amount >0
	total = amount+balance.to_i
	
	File.open("#{@account_no}balance", "w") do |aFile|
	aFile.puts "#{total}"
	
	end
	puts "\tSuccessfuly Deposit amount #{amount}"
	puts "\t your new balance is Rs.#{total}"
	else
		puts "\tNot a valid amount to deposit enter amount \n\tamount should be more than 0 (zero)"
		deposit
	end

end


