$:.unshift File.join(File.dirname(__FILE__), ".") # current directory
require 'menu'

class Atm
 def start
   Menu.new
 end
end
