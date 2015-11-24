module Enumerable
	def my_each
	 	if self.is_a? Array
	 		for index in 0...self.length do yield(self[index]); end 
	 	elsif self.is_a? Hash
	 		keys = self.keys
	 		for index in 0...self.length do yield(keys[index], self[keys[index]]); end
	 	end		
	end
	def my_each_with_index
		if self.is_a? Array
	 		for index in 0...self.length do yield(self[index], index); end 
	 	elsif self.is_a? Hash
	 		keys = self.keys
	 		for index in 0...self.length do yield(keys[index], self[keys[index]], index); end
	 	end	
	end
	def my_select
		array = Array.new
		self.my_each do |*key, value|
			array << value if yield(*key, value)
		end
		array
	end
	def my_all?
		result = true
		self.my_each do |*key, value|
			false if yield(*key, value)
		end
		result
	end
end