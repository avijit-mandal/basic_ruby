require 'pathname'

class FileManager
  attr_reader :account
  
  Bin_file = Pathname.new(__FILE__).realpath
  PATH = File.expand_path('../../', Bin_file)
  puts PATH

  BASE_FOLDER = "temp"
  
  def self.create_dir
    
    unless Dir.exists?("#{PATH}/temp")  
      Dir.mkdir("#{PATH}/temp")
    end
    
  end
  
  def self.create_file(filename)
		file = filepath(filename)
  
    unless File.exist?(file)
    
			File.open(file, "w") do |aFile|
				aFile.puts "100"
			end
		end 
	
  end
  
  def self.read(filename)
    File.read(filepath(filename))
  end
  
  def self.write(filename, amount)
    File.write(filepath(filename), amount)
  end

  private
  
  def self.filepath(filename)
    "#{PATH}/temp/#{filename}"
  end
  
end
