def output_result
	puts $text_output
end

def convert
	$text_output = ""

	alphabet_downcase = Array.new
	for letter in ("a".."z") do
		alphabet_downcase << letter
	end

	alphabet_upcase = Array.new
	for letter in ("A".."Z") do
		alphabet_upcase << letter
	end

	$text.each_char do |char|
		if alphabet_downcase.include? char
			$text_output << alphabet_downcase[((alphabet_downcase.index(char) + $key) % alphabet_downcase.length)]
		elsif alphabet_upcase.include? char
			$text_output << alphabet_upcase[((alphabet_upcase.index(char) + $key) % alphabet_upcase.length)]
		else
			$text_output << char
		end
	end
end

def prepare
	$text_array = $text.split("")
end

def get_text
	puts "Give me a string to convert"
	$text = gets.chomp
	puts "Give me a key"
	$key = gets.chomp.to_i
end 

get_text
convert
output_result