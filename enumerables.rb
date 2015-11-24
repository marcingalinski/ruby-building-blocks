module Enumerable
	def my_each
	 	for index in 0...self.length do yield(self[index]); end 
	end

	def my_each_with_index
	 	for index in 0...self.length do yield(self[index], index); end 
	end

	def my_select
		result_array = Array.new
		self.my_each do |value|
			result_array << value if yield value
		end
		result_array
	end

	def my_all?
		result = true
		self.my_each do |value|
			result = false unless yield value
		end
		result
	end

	def my_any?
		result = false
		self.my_each do |value|
			result = true if yield value
		end
		result
	end

	def my_none?
		!self.my_any? { |value| yield value }
	end

	def my_count argument=nil
		count = 0
		if block_given?
			self.my_each { |value| count += 1 if yield(value) }
		elsif argument == nil
			self.my_each { |value| count += 1 }
		else
			self.my_each { |value| count += 1 if value == argument }
		end
		count
	end

	def my_map
		result = []
		self.my_each { |*key, value| result << yield(*key, value) }
		result
	end
end