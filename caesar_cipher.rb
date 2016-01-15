def convert(text, key)
	downcase = ('a'..'z').to_a
	upcase = ('A'..'Z').to_a

	t = text.each_char.map do |char|
		if downcase.include? char
			downcase[((downcase.index(char) + key) % downcase.size)]
		elsif upcase.include? char
			upcase[((upcase.index(char) + key) % upcase.size)]
		else
			char
		end
	end

	t.join
end
