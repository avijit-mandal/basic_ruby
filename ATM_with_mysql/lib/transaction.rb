require 'account'
require 'db_manager'

module Atm 
	class Transaction
		
		attr_reader :account, :entry
		
		def initialize
			@account = Account.new
			
		end
		
		def self.start
			atm = self.new
			atm.get_account_number
			atm.create_balance_db
			atm.menu
		end
		
		def get_account_number
			account.get_account_no
		end
		
		def process
			if entry=="D" || entry=="d"
				account.deposit
			elsif entry=="W" || entry=="w"
				account.withdraw
			elsif entry=="B" || entry=="b"
				account.balance
			elsif entry == 'Q'  || entry=="q"
				puts "\tThank you for using our service"
				return
			else
				puts "\tEnter a correct key D, W, B or Q"
			end
			menu
		end

		def menu
			print "\tD)deposit W)ithdraw B)alance Q)uite :"
			@entry = gets.strip
			process
		end
		
		def create_balance_db
			Utility::DB_Manager.create_balance_db(balance_account_no)
		end
		
		private
		
		def balance_account_no
		  "#{account.account_no}"
		end
	end
end