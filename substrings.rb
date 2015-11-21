def get_text
	puts "Enter your text here"
	$text = gets.chomp.downcase.gsub(/[,.!?]/, "").split
	puts "Enter your dictionary,separating words with spaces"
	$dictionary = gets.chomp.downcase.split
end 
def count
	$dictionary_counted = Hash.new

	$dictionary.each do |dictionary_word|
		$dictionary_counted[dictionary_word] = 0

		$text.each do |text_word|
			$dictionary_counted[dictionary_word] += 1 if dictionary_word == text_word
		end
	end
end
def print_output
	$dictionary_counted.each do |word, count|
		puts "\"#{word}\" appears #{count.to_s} times"
	end
end
get_text
count
print_output