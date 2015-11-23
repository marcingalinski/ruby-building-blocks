def convert (text, key)
	text_output = ""

	alphabet_downcase = Array.new
	for letter in ("a".."z") do
		alphabet_downcase << letter
	end

	alphabet_upcase = Array.new
	for letter in ("A".."Z") do
		alphabet_upcase << letter
	end

	text.each_char do |char|
		if alphabet_downcase.include? char
			text_output << alphabet_downcase[((alphabet_downcase.index(char) + key) % alphabet_downcase.length)]
		elsif alphabet_upcase.include? char
			text_output << alphabet_upcase[((alphabet_upcase.index(char) + key) % alphabet_upcase.length)]
		else
			text_output << char
		end
	end

	puts text_output
end