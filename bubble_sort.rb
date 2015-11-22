class Array
	def bubble_sort
		swapped = true
		while swapped do
			swapped = false
			for index in 0...(self.length - 1)
				if self[index] > self[index + 1]
					value = self[index]
					self[index] = self[index + 1]
					self[index + 1] = value
					swapped = true
				end
			end
		end
		self
	end
end