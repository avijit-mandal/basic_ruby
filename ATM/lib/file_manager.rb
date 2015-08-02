class FileManager
  attr_reader :account

  BASE_FOLDER = "temp"
  
  def self.create_dir
    
    unless Dir.exists?("../#{BASE_FOLDER}")  
      Dir.mkdir("../#{BASE_FOLDER}")
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
  
  private
  
  def self.filepath(filename)
    "../#{BASE_FOLDER}/#{filename}"
  end
  
end
