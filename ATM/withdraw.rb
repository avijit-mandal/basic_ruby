

def withdraw
	balance = File.open("#{@account_no}balance", &:gets)
	
	print "\tEnter the amount you want to withdraw:  "
	money= gets
	amount=money.to_i
	if amount <= balance.to_i && amount >0
		
	total= balance.to_i - amount
	
	File.open("#{@account_no}balance", "w") do |aFile|
	aFile.puts "#{total}"
	end
	
	puts "\tSuccessfuly withdraw amount #{amount}"
	puts "\t your new balance is Rs.#{total}"
	else
		puts "\tamount should be more than 0 and less than #{balance}"
		withdraw
	end
	
	


end


