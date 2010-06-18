def count_triple(str)
  str.length - str.gsub(/(.)(?=\1\1)/,'').length
end