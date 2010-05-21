def sum_limit(a,b)
  if (a+b).to_s.length > a.to_s.length
    return a
  else
    return a + b
  end
end