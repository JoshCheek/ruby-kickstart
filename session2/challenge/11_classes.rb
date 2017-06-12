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
  attr_accessor :beers

  def initialize(beers)
    beers = 0 if beers < 0
    beers = 99 if beers > 99
    self.beers = beers
  end

  def print_song
    beers.downto 1 do |i|
      print_lyrics i
    end
  end

  def print_lyrics(n)
    #lyrics go here
    if n.zero?
      String.new
    else
    puts "#{num_to_let n} #{bottle n} of beer on the wall,"        ,
         "#{num_to_let n} #{bottle n} of beer,"                    ,
         "Take one down, pass it around,"                         ,
         "#{num_to_let n - 1} #{bottle n - 1} of beer on the wall."
    end
  end

  def bottle(n)
    # change bottles to bottle for number one
    if n == 1 then 'bottle' else 'bottles' end
  end

  def num_to_let(n)
    # change integers to words
    if 0 <= n && n <= 19
      %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)[n]
    elsif n % 10 == 0
      %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)[n/10]
    else
      "#{num_to_let n/10*10}-#{num_to_let n%10}".downcase
    end.capitalize
  end
end
