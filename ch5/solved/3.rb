def equal_is_not?(str)
  str.scan(/is/).size == str.scan(/not/).size
end