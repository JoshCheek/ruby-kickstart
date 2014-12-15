def alternate_words(sentence)
  # this will get better when we learn regular expressions :)
  '!@$#%^&*()-=_+[]:;,./<>?\\|'.split(//).each do |char|
    sentence = sentence.gsub(char, ' ')
  end
  words = sentence.split
  solution = []
  words.each_with_index do |word, index|
    solution << word if index.even?
  end
  solution
end
