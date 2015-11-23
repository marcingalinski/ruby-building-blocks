class Array
	def bubble_sort
		sort_it(self, (self[index] > self[index + 1]))
		self
	end

	def bubble_sort_by
		sort_it(self, (yield(self[index], self[index + 1]) > 0))
		self
	end

	private
	def sort_it(array, condition)
		swapped = true
		while swapped do
			swapped = false
			for index in 0...(array.length - 1)
				if condition
					value = array[index]
					array[index] = array[index + 1]
					array[index + 1] = value
					swapped = true
				end
			end
		end
	end
end