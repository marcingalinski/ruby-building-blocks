module Enumerable
	def my_each
	 	for value in self do yield(value); end 
	end

	def my_each_with_index
	 	for index in 0...self.length do yield(self[index], index); end 
	end

	def my_select
		result_array = Array.new

		self.my_each do |value|
			result_array << value if yield(value)
		end

		result_array
	end

	def my_all?
		result = true

		self.my_each do |value|
			result = false unless yield(value)
		end

		result
	end

	def my_any?
		result = false

		self.my_each do |value|
			result = true if yield(value)
		end

		result
	end

	def my_none?
		!self.my_any? { |value| yield(value) }
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

	# def my_map
	# 	result_array = Array.new
	# 	self.my_each { |value| result_array << yield(value) }
	# 	result_array
	# end

	def my_map proc
		temp_array = Array.new
		result_array = Array.new
		self.my_each { |value| temp_array << proc.call(value) }
		if block_given?
			temp_array.my_each { |value| result_array << yield(value) }
		else
			result_array = temp_array
		end
		result_array
	end

	def my_inject *args
		symbol = (args.my_select { |arg| arg.is_a? Symbol })[0]
		memo = (args.my_select { |arg| !arg.is_a? Symbol })[0]
		memo ||= self[0]

		if block_given?
			self.my_each { |value| memo = yield(memo, value) }
		else
			self.my_each { |value| memo = memo.send(symbol, value) }
		end

		memo
	end
end

def multiply_els array
	array.my_inject(1, :*)
end

multiply_els([2,4,5])