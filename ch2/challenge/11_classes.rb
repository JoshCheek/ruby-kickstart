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
  attr_accessor :bottles
  
  def initialize(bottles)
    if bottles < 0
      self.bottles = 0
    elsif bottles > 99
      self.bottles = 99
    else
      self.bottles = bottles
    end
  end
  
  def bottles_string(n)
    tens = case n / 10
    when 1 then "One"
    when 2 then "Twenty"
    when 3 then "Thirty"
    when 4 then "Forty"
    when 5 then "Fifty"
    when 6 then "Sixty"
    when 7 then "Seventy"
    when 8 then "Eighty"
    when 9 then "Ninety"
    else ""
    end

    ones = case n % 10
    when 1 then "One"
    when 2 then "Two"
    when 3 then "Three"
    when 4 then "Four"
    when 5 then "Five"
    when 6 then "Six"
    when 7 then "Seven"
    when 8 then "Eight"
    when 9 then "Nine"
    else "Zero"
    end

    # 19 - 10
    if tens == "One"
      if ones == "Zero"
        tens = "Ten"
      else
        if !(ones =~ /Three|Two|One/)
          tens = ones + "teen"
          ones = "Zero"
        else
          tens = case ones
          when "Three" then "Thirteen"
          when "Two" then "Twelve"
          when "One" then "Eleven"
          else tens
          end
          ones = "Zero"
        end

      end
    # 9 - 0
    elsif tens == ""
      tens = ones
      ones = "Zero"  
    end 
       
    string = tens

    string += "-" + ones if ones != "Zero"

    string
  end
  
  def plural(n)
    return "bottles" unless n == 1
    "bottle"
  end
  
  def print_song
    bottles.downto 1 do |n|
      puts "#{bottles_string n} #{plural n} of beer on the wall,",
           "#{bottles_string n} #{plural n} of beer,",
           "Take one down, pass it around,",
           "#{bottles_string n - 1} #{plural n-1} of beer on the wall.",
           ""
    end
  end
end

b = BeerSong.new 22
b.print_song