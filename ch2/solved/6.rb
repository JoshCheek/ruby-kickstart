class Integer
  def prime?
    2.upto Math.sqrt(self) do |i|
      return false if self % i == 0
    end
    true
  end
end

def prime_chars?(strings)
  sum = 0
  strings.each { |string| sum += string.length }
  sum.prime?
end
