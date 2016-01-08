def convert(text, key)
	downcase = ('a'..'z').to_a
	upcase = ("A".."Z").to_a

	text.each_char.map do |char|
		if downcase.include? char
			downcase[((downcase.index(char) + key) % downcase.length)]
		elsif upcase.include? char
			upcase[((upcase.index(char) + key) % upcase.length)]
		else
			char
		end
	end
end
