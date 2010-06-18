def count_YZ(str)
  str.scan(/(y|z)([^a-z]|\b)/i).size
end