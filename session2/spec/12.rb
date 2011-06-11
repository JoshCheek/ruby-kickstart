common_denominator_factorings = [
                          [5, 7, 17, 19] ,         [2, 2, 2, 5, 7, 7, 13, 17, 19] ,       [5, 7, 17, 19] ,
                               [3, 3, 7] ,           [3, 5, 5, 7, 13, 19, 19, 19] ,               [3, 7] ,
               [3, 3, 3, 3, 7, 7, 7, 11] ,                [2, 2, 3, 5, 7, 13, 17] ,               [3, 7] ,
                [2, 3, 5, 7, 11, 13, 19] ,                         [3, 3, 11, 17] ,              [3, 11] ,
                                     [7] ,   [2, 3, 3, 5, 13, 13, 17, 17, 19, 19] ,                   [] ,
              [3, 5, 11, 13, 17, 19, 19] ,                                   [17] ,                 [17] ,
                             [7, 13, 13] ,                 [3, 5, 11, 11, 11, 13] ,                 [13] ,
                       [2, 2, 3, 11, 11] ,      [2, 3, 3, 5, 5, 7, 7, 17, 17, 19] ,               [2, 3] ,
                                     [2] ,                               [13, 13] ,                   [] ,
                         [2, 11, 13, 19] ,                         [2, 3, 13, 13] ,              [2, 13] ,
                         [2, 13, 17, 19] ,      [3, 3, 3, 11, 11, 11, 13, 13, 19] ,             [13, 19] ,
                    [2, 3, 3, 7, 11, 19] ,    [2, 2, 3, 5, 7, 11, 11, 11, 19, 19] ,    [2, 3, 7, 11, 19] ,
                                 [7, 13] ,      [2, 2, 5, 5, 7, 7, 7, 11, 11, 19] ,                  [7] ,
         [2, 2, 3, 3, 3, 3, 5, 5, 5, 19] ,            [2, 2, 5, 7, 7, 11, 13, 17] ,            [2, 2, 5] ,
     [3, 5, 5, 7, 7, 11, 13, 13, 13, 17] ,                                   [19] ,                   [] ,
                                [13, 13] ,                         [2, 5, 17, 19] ,                   [] ,
                [2, 5, 7, 7, 17, 17, 19] ,                [2, 2, 5, 5, 7, 11, 13] ,            [2, 5, 7] ,
                     [3, 7, 7, 7, 7, 13] ,                [2, 2, 3, 5, 7, 11, 19] ,               [3, 7] ,
                                  [2, 7] ,                       [2, 2, 7, 7, 17] ,               [2, 7] ,
             [2, 3, 5, 5, 5, 13, 13, 19] ,      [2, 3, 3, 5, 7, 7, 7, 11, 17, 17] ,            [2, 3, 5] ,
                          [2, 7, 13, 17] ,                            [5, 11, 17] ,                 [17] ,
       [2, 2, 5, 5, 5, 7, 7, 11, 19, 19] ,                            [2, 17, 17] ,                  [2] ,
                        [13, 13, 13, 19] ,         [2, 2, 3, 3, 5, 7, 13, 13, 19] ,         [13, 13, 19] ,
               [2, 5, 5, 11, 11, 13, 13] ,       [2, 3, 5, 5, 5, 7, 7, 7, 13, 17] ,        [2, 5, 5, 13] ,
                          [2, 5, 11, 19] ,                              [5, 5, 7] ,                  [5] ,
                 [2, 13, 13, 17, 17, 19] ,             [2, 2, 3, 3, 7, 7, 19, 19] ,              [2, 19] ,
                             [3, 11, 11] ,              [2, 3, 5, 11, 11, 11, 13] ,          [3, 11, 11] ,
                   [2, 5, 5, 11, 13, 17] ,           [2, 3, 5, 5, 11, 13, 13, 19] ,    [2, 5, 5, 11, 13] ,
          [2, 3, 5, 7, 7, 7, 17, 19, 19] ,              [5, 5, 5, 17, 17, 19, 19] ,      [5, 17, 19, 19] ,
 [7, 11, 11, 11, 11, 13, 13, 13, 13, 17] ,                                   [17] ,                 [17] ,
].map do |factors| 
  factors.inject(1) { |a,b| a*b }
end



describe 'Fraction' do
  
  it 'should be a class called Fraction' do
    the_classes = Module.constants.map { |c| c.to_s }.grep('Fraction')
    the_classes.first.should == 'Fraction'
    the_classes.size.should == 1
    Fraction.class.should == Class
  end
  
  it 'should initialize with the first param being the numerator and the second being the denominator' do
    lambda { Fraction.new 20 , 60 }.should_not raise_error
  end
  
  it 'should know its numerator' do
    Fraction.new(20,60).numerator.should == 20
  end
  
  it 'should know its denominator' do
    Fraction.new(20,60).denominator.should == 60
  end 
  
  it 'should represent 20/60 as the String "20/60"' do
    Fraction.new(20,60).to_s.should == "20/60"
  end
  
  it 'should allow the numerator to be changed' do
    f = Fraction.new(20,60)
    f.numerator = 50
    f.numerator.should == 50
  end
  
  it 'should allow the denominator to be changed' do
    f = Fraction.new(20,60)
    f.denominator = 100
    f.denominator.should == 100
  end
  
  it 'should represent itself as a float' do
    Fraction.new(50,100).to_f.should == 0.5
    Fraction.new(0,200).to_f.should == 0.0
  end
  
  it 'should have a working gcd method' do
    f = Fraction.new 10 , 10
    f.gcd(20,60).should == 20
    f.gcd(100,5).should == 5
    common_denominator_factorings.each_slice 3 do |numerator,denominator,common|
      f.gcd( numerator , denominator ).should == common
    end
  end
  
  it 'should represent itself in lowest common terms' do
    f = Fraction.new(20,60).lowest
    f.numerator.should == 1
    f.denominator.should == 3
    common_denominator_factorings.each_slice 3 do |numerator,denominator,common|
      f = Fraction.new( numerator , denominator ).lowest
      f.numerator.should == numerator / common
      f.denominator.should == denominator / common
    end
  end
  
  
end