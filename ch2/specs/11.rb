require File.join( File.dirname(__FILE__) , 'helper' )

def stanza(n)
  return n.map { |i| stanza i }.reverse.flatten if n.is_a? Range
  return [''] if n == 0
  return "One bottle of beer on the wall,\nOne bottle of beer,\nTake one down, pass it around,\nZero bottles of beer on the wall.".split("\n") if n == 1
  @translation ||= %w(Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen Twenty Twenty-one Twenty-two Twenty-three Twenty-four Twenty-five Twenty-six Twenty-seven Twenty-eight Twenty-nine Thirty Thirty-one Thirty-two Thirty-three Thirty-four Thirty-five Thirty-six Thirty-seven Thirty-eight Thirty-nine Forty Forty-one Forty-two Forty-three Forty-four Forty-five Forty-six Forty-seven Forty-eight Forty-nine Fifty Fifty-one Fifty-two Fifty-three Fifty-four Fifty-five Fifty-six Fifty-seven Fifty-eight Fifty-nine Sixty Sixty-one Sixty-two Sixty-three Sixty-four Sixty-five Sixty-six Sixty-seven Sixty-eight Sixty-nine Seventy Seventy-one Seventy-two Seventy-three Seventy-four Seventy-five Seventy-six Seventy-seven Seventy-eight Seventy-nine Eighty Eighty-one Eighty-two Eighty-three Eighty-four Eighty-five Eighty-six Eighty-seven Eighty-eight Eighty-nine Ninety Ninety-one Ninety-two Ninety-three Ninety-four Ninety-five Ninety-six Ninety-seven Ninety-eight Ninety-nine)
  <<-STANZA.gsub(/^\s+/,'').split("\n")
    #{@translation[n]} bottles of beer on the wall,
    #{@translation[n]} bottles of beer,
    Take one down, pass it around,
    #{@translation[n-1]} bottle#{ n == 2 ? '' : 's' } of beer on the wall.
  STANZA
end


def check_results_for(n)
  input_output { BeerSong.new(n).print_song }.split("\n").reject { |line| line.empty? }.should == stanza(1..n)
end

describe 'BeerSong' do
  
  it 'should be a class called BeerSong' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('BeerSong')
    the_classes.first.should == 'BeerSong'
    the_classes.size.should == 1
    BeerSong.class.should == Class
  end
  
  it 'should have an initialize method which receives one parameter' do
    lambda { BeerSong.new 5 }.should_not raise_error
  end
  
  it 'should print nothing when initialized with 0' do
    input_output { BeerSong.new(0).print_song }.chomp.should == String.new
  end
  
  it 'should be correct for one bottle of beer' do
    check_results_for 1
  end
  
  it 'should be correct for two bottles of beer' do
    check_results_for 2
  end
  
  it 'should be correct for three bottles of beer' do
    check_results_for 3
  end
  
  it 'should print nothing for values less than 0' do
    input_output do 
      BeerSong.new(-1).print_song 
      BeerSong.new(-3).print_song 
      BeerSong.new(-192).print_song 
    end.split("\n").should == Array.new
  end
  
  it 'should print the entire song for 99' do
    check_results_for 99
  end
  
  it 'should print the entire song for values greater than 99' do
    result = stanza 1..99
    input_output { BeerSong.new(99).print_song }.split("\n").should == result
    input_output { BeerSong.new(99).print_song }.split("\n").should == result
    input_output { BeerSong.new(99).print_song }.split("\n").should == result
  end
end
