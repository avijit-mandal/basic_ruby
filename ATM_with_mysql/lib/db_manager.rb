
require 'mysql2'
require 'pathname'

module Utility
	module DB_Manager
	  extend self
	  attr_reader :account
	  
	  def client
      Mysql2::Client.new(:host => "localhost", :username => "root", :database => 'atm')
    end
    
    
	  def create_balance_db(account)
      client.query("SELECT balance FROM accounts WHERE account_no = '#{account}'").each do |row|
        @row=row
      end
		
      if !@row
        client.query("INSERT INTO accounts VALUES (#{account}, 100);")
      end
	    
	  end
	 
	  
	  def read(account_no)
      
      res = client.query("SELECT balance FROM accounts WHERE account_no = '#{account_no}'")
      result=res.map{|row| row['balance']}
      @current_balance = result[0]
      
      return @current_balance
	  
    end
	  
	  def write(account_no, amount)

      client.query("UPDATE accounts SET balance = '#{amount}' WHERE account_no = '#{account_no}' ")
	    
	  end


	end
end