def problem_8( *params )

  # note that if you are on 1.9, you can get rid of most of this weird param juggling
  # check if hash was submitted, if so, remove it, and assign it to the var
  # if not, default to :count_clumps
  problem = if params.last.is_a?(Hash) then params.pop[:problem] else :count_clumps end
  
  # forward the params to the actual problem
  if problem == :count_clumps
    count_clumps *params # !> `*' interpreted as argument prefix
  else
    same_ends *params # !> `*' interpreted as argument prefix
  end
  
end


def count_clumps(*params)
  
  count , last , clump = 0 , nil , false
  
  params.each do |crnt|
    clump = if last == crnt
      true
    elsif clump
      count += 1
      false
    end
    last = crnt
  end
  
  count + if clump then 1 else 0 end
end



def same_ends( n , *params )
  params[0,n] == params[-n,n]
end