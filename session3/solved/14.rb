# This can be handled in a much cleaner way in 1.9, without the params fiddling

def problem_14(*params)
  hash    = if params[-1].is_a? Hash then params.pop else nil end
  problem = if hash then hash[:problem] else :count_clumps end

  return count_clumps *params if problem == :count_clumps
  return same_ends *params    if problem == :same_ends
end

def count_clumps(*numbers)
  clumps     = 0
  previous   = nil
  two_before = nil

  numbers.each do |number|
    clumps += 1 if (previous == number) && !(previous == two_before)
    two_before = previous
    previous = number
  end
  clumps
end


def same_ends( n , *params )
  params[0,n] == params[-n,n]
end