# Given a sentence, return an array containing every other word.
# Punctuation is not part of the word unless it is a contraction.
# In order to not have to write an actual language parser, there won't be any punctuation too complex.
# There will be no "'" that is not part of a contraction.
# Assume each of these  charactsrs are not to be considered: ! @ $ # % ^ & * ( ) - = _ + [ ] : ; , . / < > ? \ |
# 
# Examples
# alternate_words("Lorem ipsum dolor sit amet.")  # => ["Lorem", "dolor", "amet"]
# alternate_words("Can't we all get along?")      # => ["Can't", "all", "along"]
# alternate_words("Elementary, my dear Watson!")  # => ["Elementary", "dear"]

def alternate_words sentence
	words = sentence.gsub('--',' ').gsub('-',' ').split(' ')
	#punctuations = [',','.','?','!',';',':','(',')']
	words.each do |word|
		word.gsub!(',','')
		word.gsub!('.','')
		word.gsub!('?','')
		word.gsub!('!','')
		word.gsub!(';','')
		word.gsub!(':','')
		word.gsub!(')','')
		word.gsub!('(','')
	end
	words.select!{|word| word != ''}
	#puts "#{words}"
	result = []; switch = true
	words.each do|word| 
		if switch
			result << word
			switch = false
		else
			switch = true
		end
	end
	result
end	



#puts "#{alternate_words("Lorem ipsum dolor sit amet.")}"
#puts "#{alternate_words("Can't we all get along?")}"
#puts "#{alternate_words("I could have made money this way, and perhaps amused myself writing code. But I knew that at the end of my career, I would look back on years of building walls to divide people, and feel I had spent my life making the world a worse place.")}"

#puts "#{alternate_words("of my career, I would look back on years of building walls to divide people, and feel I had spent my life making the world a worse place.")}"


