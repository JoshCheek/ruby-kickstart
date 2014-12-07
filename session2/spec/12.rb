common_denominator_factorings = [
  [                         [5, 7, 17, 19],         [2, 2, 2, 5, 7, 7, 13, 17, 19],       [5, 7, 17, 19]],
  [                              [3, 3, 7],           [3, 5, 5, 7, 13, 19, 19, 19],               [3, 7]],
  [              [3, 3, 3, 3, 7, 7, 7, 11],                [2, 2, 3, 5, 7, 13, 17],               [3, 7]],
  [               [2, 3, 5, 7, 11, 13, 19],                         [3, 3, 11, 17],              [3, 11]],
  [                                    [7],   [2, 3, 3, 5, 13, 13, 17, 17, 19, 19],                   []],
  [             [3, 5, 11, 13, 17, 19, 19],                                   [17],                 [17]],
  [                            [7, 13, 13],                 [3, 5, 11, 11, 11, 13],                 [13]],
  [                      [2, 2, 3, 11, 11],      [2, 3, 3, 5, 5, 7, 7, 17, 17, 19],               [2, 3]],
  [                                    [2],                               [13, 13],                   []],
  [                        [2, 11, 13, 19],                         [2, 3, 13, 13],              [2, 13]],
  [                        [2, 13, 17, 19],      [3, 3, 3, 11, 11, 11, 13, 13, 19],             [13, 19]],
  [                   [2, 3, 3, 7, 11, 19],    [2, 2, 3, 5, 7, 11, 11, 11, 19, 19],    [2, 3, 7, 11, 19]],
  [                                [7, 13],      [2, 2, 5, 5, 7, 7, 7, 11, 11, 19],                  [7]],
  [        [2, 2, 3, 3, 3, 3, 5, 5, 5, 19],            [2, 2, 5, 7, 7, 11, 13, 17],            [2, 2, 5]],
  [    [3, 5, 5, 7, 7, 11, 13, 13, 13, 17],                                   [19],                   []],
  [                               [13, 13],                         [2, 5, 17, 19],                   []],
  [               [2, 5, 7, 7, 17, 17, 19],                [2, 2, 5, 5, 7, 11, 13],            [2, 5, 7]],
  [                    [3, 7, 7, 7, 7, 13],                [2, 2, 3, 5, 7, 11, 19],               [3, 7]],
  [                                 [2, 7],                       [2, 2, 7, 7, 17],               [2, 7]],
  [            [2, 3, 5, 5, 5, 13, 13, 19],      [2, 3, 3, 5, 7, 7, 7, 11, 17, 17],            [2, 3, 5]],
  [                         [2, 7, 13, 17],                            [5, 11, 17],                 [17]],
  [      [2, 2, 5, 5, 5, 7, 7, 11, 19, 19],                            [2, 17, 17],                  [2]],
  [                       [13, 13, 13, 19],         [2, 2, 3, 3, 5, 7, 13, 13, 19],         [13, 13, 19]],
  [              [2, 5, 5, 11, 11, 13, 13],       [2, 3, 5, 5, 5, 7, 7, 7, 13, 17],        [2, 5, 5, 13]],
  [                         [2, 5, 11, 19],                              [5, 5, 7],                  [5]],
  [                [2, 13, 13, 17, 17, 19],             [2, 2, 3, 3, 7, 7, 19, 19],              [2, 19]],
  [                            [3, 11, 11],              [2, 3, 5, 11, 11, 11, 13],          [3, 11, 11]],
  [                  [2, 5, 5, 11, 13, 17],           [2, 3, 5, 5, 11, 13, 13, 19],    [2, 5, 5, 11, 13]],
  [         [2, 3, 5, 7, 7, 7, 17, 19, 19],              [5, 5, 5, 17, 17, 19, 19],      [5, 17, 19, 19]],
  [[7, 11, 11, 11, 11, 13, 13, 13, 13, 17],                                   [17],                 [17]],
].map do |factors_group|
  factors_group.map do |factors|
    factors.inject(1) { |a,b| a*b }
  end
end


RSpec.describe 'Fraction' do
  it 'knows its numerator' do
    expect(Fraction.new(20,60).numerator).to eq 20
  end

  it 'knows its denominator' do
    expect(Fraction.new(20,60).denominator).to eq 60
  end

  it 'represents 20/60 as the String "20/60"' do
    expect(Fraction.new(20,60).to_s).to eq "20/60"
  end

  it 'allows the numerator to be changed' do
    f = Fraction.new(20,60)
    f.numerator = 50
    expect(f.numerator).to eq 50
  end

  it 'allows the denominator to be changed' do
    f = Fraction.new(20,60)
    f.denominator = 100
    expect(f.denominator).to eq 100
  end

  it 'can be converted to a float' do
    expect(Fraction.new(50,100).to_f).to eq 0.5
    expect(Fraction.new(0,200).to_f).to eq 0.0
  end

  it 'can find its greatest common denominator with another number' do
    f = Fraction.new 10 , 10
    expect(f.gcd 20, 60).to eq 20
    expect(f.gcd 100, 5).to eq 5
    common_denominator_factorings.each do |numerator, denominator, common|
      expect(f.gcd numerator , denominator).to eq common
    end
  end

  it 'represents itself in lowest common terms' do
    f = Fraction.new(20,60).lowest
    expect(f.numerator).to eq 1
    expect(f.denominator).to eq 3
    common_denominator_factorings.each do |numerator, denominator, common|
      f = Fraction.new(numerator , denominator).lowest
      expect(f.numerator).to eq numerator / common
      expect(f.denominator).to eq denominator / common
    end
  end
end
