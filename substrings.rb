def word_counter (text, dictionary)
	dictionary_counted = Hash.new

	dictionary.each do |dictionary_word|
		dictionary_counted[dictionary_word] = 0

		text.each do |text_word|
			dictionary_counted[dictionary_word] += 1 if dictionary_word == text_word
		end
	end
	
	dictionary_counted.each do |word, count|
		puts "\"#{word}\" appears #{count.to_s} times"
	end
end