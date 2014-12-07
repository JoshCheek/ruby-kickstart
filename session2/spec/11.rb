require_relative 'helper'

RSpec.describe 'BeerSong' do
  def stanza(n)
    return n.map { |i| stanza i }.reverse.flatten if n.is_a? Range
    return [''] if n == 0
    return "One bottle of beer on the wall,\nOne bottle of beer,\nTake one down, pass it around,\nZero bottles of beer on the wall.".split("\n") if n == 1
    @translation ||= %w(Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen Twenty Twenty-one Twenty-two Twenty-three Twenty-four Twenty-five Twenty-six Twenty-seven Twenty-eight Twenty-nine Thirty Thirty-one Thirty-two Thirty-three Thirty-four Thirty-five Thirty-six Thirty-seven Thirty-eight Thirty-nine Forty Forty-one Forty-two Forty-three Forty-four Forty-five Forty-six Forty-seven Forty-eight Forty-nine Fifty Fifty-one Fifty-two Fifty-three Fifty-four Fifty-five Fifty-six Fifty-seven Fifty-eight Fifty-nine Sixty Sixty-one Sixty-two Sixty-three Sixty-four Sixty-five Sixty-six Sixty-seven Sixty-eight Sixty-nine Seventy Seventy-one Seventy-two Seventy-three Seventy-four Seventy-five Seventy-six Seventy-seven Seventy-eight Seventy-nine Eighty Eighty-one Eighty-two Eighty-three Eighty-four Eighty-five Eighty-six Eighty-seven Eighty-eight Eighty-nine Ninety Ninety-one Ninety-two Ninety-three Ninety-four Ninety-five Ninety-six Ninety-seven Ninety-eight Ninety-nine)
    <<-STANZA.gsub(/^\s+/,'').split("\n")
      #{@translation[n]} bottles of beer on the wall,
      #{@translation[n]} bottles of beer,
      Take one down, pass it around,
      #{@translation[n-1]} bottle#{n == 2 ? '' : 's'} of beer on the wall.
    STANZA
  end

  def check_results_for(n)
    lines = input_output { BeerSong.new(n).print_song }
              .split("\n")
              .reject { |line| line.empty? }
    expect(lines).to eq stanza(1..n)
  end

  it 'prints nothing when there is no beer' do
    output = input_output { BeerSong.new(0).print_song }.chomp
    expect(output).to eq String.new
  end

  it 'prints the first stanza when there is 1 bottle of beer' do
    check_results_for 1
  end

  it 'prints the second stanza when there are 2 bottles of beer' do
    check_results_for 2
  end

  it 'prints the third stanza when there are 3 bottles of beer' do
    check_results_for 3
  end

  it 'prints nothing when we have have negative bottles of beer' do
    output = input_output do
      BeerSong.new(-1).print_song
      BeerSong.new(-3).print_song
      BeerSong.new(-192).print_song
    end
    expect(output.split "\n").to eq []
  end

  it 'prints the entire song when there are 99 bottles of beer' do
    check_results_for 99
  end

  it 'caps the beer at 99 when there are more than 99 bottles of beer' do
    result = stanza 1..99
    expect(input_output { BeerSong.new( 99).print_song }.split("\n")).to eq result
    expect(input_output { BeerSong.new(100).print_song }.split("\n")).to eq result
    expect(input_output { BeerSong.new(101).print_song }.split("\n")).to eq result
  end
end
