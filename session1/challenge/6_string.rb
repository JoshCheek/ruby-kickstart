# You'll get a string and a boolean.
# When the boolean is true, return a new string containing all the odd characters.
# When the boolean is false, return a new string containing all the even characters.
# 
# If you have no idea where to begin, remember to check out the cheatsheets for string and logic/control
# 
# odds_and_evens("abcdefg",true)    # => "bdf"
# odds_and_evens("abcdefg",false)   # => "aceg"

def odds_and_evens1(string, return_odds)
	result = ''
	if return_odds
		string.split(//).each.with_index{|x, i| result += x if i%2 == 1}
	else
		string.split(//).each.with_index{|x, i| result += x if i%2 == 0}
	end
	return result
end

def odds_and_evens(string, return_odds)
	result = ''
	string.split(//).each.with_index do |x, i| 
		if return_odds
			result += x if i%2 ==1
		else
			result += x if i%2 ==0
		end 
	end
	return result
end

#puts odds_and_evens('abcdefg',true)