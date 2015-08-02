require './file_manager'

class Account
	attr_accessor :account_no
		
	def get_account_no
		print "\tEnter your Account No.: "
		@account_no = gets.to_i
	end

	def deposit
		balance = FileManager.read(balance_file_name)
		
		print "\tEnter the amount you want to deposite:  "
		money= gets
		amount=money.to_i
		if amount >0
			total = amount+balance.to_i
		
			File.open("../temp/#{balance_file_name}", "w") do |aFile|
				aFile.puts "#{total}"
			end
			puts "\tSuccessfuly Deposit amount #{amount}"
			puts "\tYour new balance is Rs.#{total}"
		else
			puts "\tNot a valid amount to deposit enter amount \n\tamount should be more than 0 (zero)"
			deposit
		end

	end



	def withdraw
		balance = FileManager.read(balance_file_name)
		
		print "\tEnter the amount you want to withdraw:  "
		money= gets
		amount=money.to_i
		if amount <= balance.to_i && amount > 0
			
		total= balance.to_i - amount
		
		File.open("../temp/#{balance_file_name}", "w") do |aFile|
		aFile.puts "#{total}"
		end
		
		puts "\tSuccessfuly withdraw amount #{amount}"
		puts "\tYour new balance is Rs.#{total}"
		else
			puts "\tamount should be more than 0 and less than #{balance}"
			withdraw
		end
		
		
	end

	def balance
		balance = FileManager.read(balance_file_name)
		puts "\tYour account balance is Rs.#{balance}"
	end
	
	private
	
	def balance_file_name
	  "balance_#{account_no}"
	end
	
end

