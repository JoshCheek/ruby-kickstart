def arithmetic2(a,b)
  
  min = if a < b
    a
  else
    b
  end
  
  return min / 2.0
  
end


# A slicker solution:
# def arithmetic2(*args)
#   args.min / 2.0
# end