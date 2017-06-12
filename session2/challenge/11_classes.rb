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

  def initialize
    # initialize the class
  end

  def print
    #
  end

  def print_song(x)
    #lyrics go here
    puts "#{num_to_let x} #{bottle x} of beer on the wall,"
         "#{num_to_let x} #{bottle x} of beer,"
         "Take one down, pass it around,"
         "#{translate x - 1} #{bottle x - 1} of beer on the wall."
  end

  def num_to_let
    # change integers to words
  end

  def bottle
    # change bottles to bottle for number one
  end
end
