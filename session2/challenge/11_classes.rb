

def english_num(num,with_and = false)
	the_number = ''
	if num == 0
		the_number = 'Zero'
		return the_number
	end
	ones =['one','two','three','four','five','six','seven','eight','nine','ten']
	teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
	tens = ['ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

	if num > 99
		current = (num/100).to_i
		the_number = ones[current-1] + ' hundred '
		the_number += 'and ' if with_and == true
		num = num - current*100 
	end
	if num > 0 && num <= 10
		the_number = the_number + ones[num-1]
	elsif num >= 11 && num <= 19
		the_number = the_number + teens[num-11]
	elsif num >= 20 && num <= 99 
		if num%10 == 0
			the_number = the_number + tens[(num/10).to_i - 1]
		else
			the_number = the_number + tens[(num/10).to_i - 1] + '-' + ones[(num%10).to_i - 1]
		end
	end
	return the_number.capitalize
end
# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.


class BeerSong
	attr_accessor :num_of_beer

	def initialize(num_of_beer)
		if 0 <= num_of_beer && num_of_beer <= 99 
			@num_of_beer = num_of_beer	
		elsif num_of_beer > 99
			@num_of_beer = 99
		else
			@num_of_beer = 0
		end	
	end

	def print_song
		crrt_num_beer = @num_of_beer
		lyric = ''
		if crrt_num_beer == 0
			return nil
		end
		while true
			bottles = crrt_num_beer == 1 ? 'bottle' : 'bottles'
			lyric += "#{english_num(crrt_num_beer)} #{bottles} of beer on the wall,\n"
			lyric += "#{english_num(crrt_num_beer)} #{bottles} of beer,\n"
			lyric += "Take one down, pass it around,\n"
			crrt_num_beer -= 1
			bottles = crrt_num_beer == 1 ? 'bottle' : 'bottles'
			lyric += "#{english_num(crrt_num_beer)} #{bottles} of beer on the wall.\n"
			if crrt_num_beer <= 0
				break
			end
		end
		lyric.chomp
		puts lyric
	end	
end

