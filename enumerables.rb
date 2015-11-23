module Enumerable
	def my_each
	 	if self.is_a? Array
	 		for index in 0...self.length do yield(self[index]); end 
	 	elsif self.is_a? Hash
	 		keys = self.keys
	 		for index in 0...self.length do yield(keys[index], self[keys[index]]); end
	 	end		
	end
end