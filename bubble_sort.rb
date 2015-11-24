class Array
	def bubble_sort
		sort_it(self, (self[index] > self[index + 1]))
	end

	def bubble_sort_by
		sort_it(self, (yield(self[index], self[index + 1]) > 0))
	end

	private
	def sort_it(array, swapped, condition)
		swapped = true
		while swapped do 
			swapped = false
			iterate_array(array, swapped, condition) 
		end
		array
	end

	def iterate_array(array, swapped, condition)
		for index in 0...(array.length - 1) { swap(array, swapped) if condition }
	end

	def swap(array, swapped)
		value = array[index]
		array[index] = array[index + 1]
		array[index + 1] = value
		swapped = true
	end
end