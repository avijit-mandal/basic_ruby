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
		
		amount=gets.to_i
		if amount >0
			total = amount+FileManager.read(balance_file_name).to_i
		
			FileManager.write(balance_file_name, total)
			
			puts "\tSuccessfuly Deposit amount #{amount}"
			puts "\tYour new balance is Rs.#{FileManager.read(balance_file_name)}"
		else
			puts "\tNot a valid amount to deposit enter amount \n\tamount should be more than 0 (zero)"
			deposit
		end

	end



	def withdraw
		balance = FileManager.read(balance_file_name)
		
		print "\tEnter the amount you want to withdraw:  "
		
		amount=gets.to_i
		if amount <= FileManager.read(balance_file_name).to_i && amount > 0
			
		total= FileManager.read(balance_file_name).to_i - amount
		
		FileManager.write(balance_file_name, total)
		
		puts "\tSuccessfuly withdraw amount #{amount}"
		puts "\tYour new balance is Rs.#{FileManager.read(balance_file_name)}"
		else
			puts "\tamount should be more than 0 and less than #{FileManager.read(balance_file_name)}"
			withdraw
		end
		
		
	end

	def balance
		puts "\tYour account balance is Rs.#{FileManager.read(balance_file_name)}"
	end
	
	private
	
	def balance_file_name
	  "balance_#{account_no}"
	end
	
end

