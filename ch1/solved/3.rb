def ten_twenty(n)
  if n % 2 == 0
    10
  else
    20
  end
end


# A slicker solution
# def ten_twenty(n)
#   n.even? && 10 || 20
# end