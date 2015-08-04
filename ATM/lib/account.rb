require 'file_manager'

module Atm
	class Account
		attr_accessor :account_no, :balance
			
		def get_account_no
			print "\tEnter your Account No.: "
			@account_no = gets.to_i
		end

		def deposit
			balance = read_data
			
			amount = input_data
			
			if amount >0
				total = amount+ balance.to_i
			
				write_data(total)
				
				puts "\tSuccessfuly Deposit amount #{amount}"
				puts "\tYour new balance is Rs.#{read_data}"
			else
				puts "\tNot a valid amount to deposit enter amount \n\tamount should be more than 0 (zero)"
				deposit
			end

		end



		def withdraw
			balance = read_data
			
			print "\tEnter the amount you want to withdraw:  "
			
			amount=gets.to_i
			if amount <= balance.to_i && amount > 0
				
				total= balance.to_i - amount
			
				write_data(total)
			
				puts "\tSuccessfuly withdraw amount #{amount}"
				puts "\tYour new balance is Rs.#{read_data}"
			else
				puts "\tamount should be more than 0 and less than #{read_data}"
				withdraw
			end
			
			
		end

		def balance
			puts "\tYour account balance is Rs.#{read_data}"
		end
		
		private
		
		def balance_file_name
		  "balance_#{account_no}"
		end

		def input_data
			print "\tEnter the amount:  "
			gets.to_i
		end
		
		def read_data
			Utility::FileManager.read(balance_file_name)
		end
		
		def write_data(total)
			Utility::FileManager.write(balance_file_name, total)
		end
		
		
	end
end