require 'pathname'

module Utility
	module FileManager
	  extend self
	  attr_reader :account
	  
	  Bin_file = Pathname.new(__FILE__).realpath
	  PATH = File.expand_path('../../', Bin_file)

	  BASE_FOLDER = "temp"
	  
	  def create_dir
	    
	    unless Dir.exists?("#{PATH}/temp")  
	      Dir.mkdir("#{PATH}/temp")
	    end
	    
	  end
	  
	  def create_file(filename)
			file = filepath(filename)
	  
	    unless File.exist?(file)
	    
				File.open(file, "w") do |aFile|
					aFile.puts "100"
				end
			end 
		
	  end
	  
	  def read(filename)
	    File.read(filepath(filename))
	  end
	  
	  def write(filename, amount)
	    File.write(filepath(filename), amount)
	  end

	  private
	  
	  def filepath(filename)
	    "#{PATH}/temp/#{filename}"
	  end

	end
end