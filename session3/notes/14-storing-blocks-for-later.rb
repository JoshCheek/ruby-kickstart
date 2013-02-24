# Now that we know to use &block, we can do cool things like
# Store the block for later.
class CollegeStudent

  attr_accessor :do_when_twenty_one

  def initialize(age, &block)
    @age = age
    @do_when_twenty_one = block
  end

  def birthday!
    @age += 1
    return "#{@age}: study :(" unless @age == 21
    do_when_twenty_one.call @age
  end

end


pam = CollegeStudent.new 18 do |age|
  "#{age}: GET SAUCED!"
end

pam.birthday! # => "19: study :("
pam.birthday! # => "20: study :("
pam.birthday! # => "21: GET SAUCED!"
pam.birthday! # => "22: study :("
pam.birthday! # => "23: study :("
