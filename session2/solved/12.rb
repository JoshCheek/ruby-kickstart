class Fraction
  
  attr_accessor :numerator , :denominator
  
  def initialize( numerator , denominator )
    self.numerator , self.denominator = numerator , denominator
  end
  
  def to_s
    "#{numerator}/#{denominator}"
  end
  
  def to_f
    numerator / denominator.to_f
  end
  
  def gcd(a,b)
    if b == 0 then a else gcd( b , a%b ) end
  end

  def lowest
    divisor = gcd numerator , denominator
    Fraction.new numerator/divisor , denominator/divisor
  end
  
end