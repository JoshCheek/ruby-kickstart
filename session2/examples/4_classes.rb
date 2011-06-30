# A CLASS THAT COMPUTES A BILL FOR A LAW OFFICE
#
# taken from Absolute Java 3rd edition, chapter 4
#
# typically, a class shouldn't do it's own IO, that limits how it can be used,
# wherever the class is created should do the IO, but this is just a learning exercise
# so I'm not going to rewrite it, this is just a translation from Java to Ruby

class Bill
  RATE = 150.00  # dollars per quarter hour (note that it's bad practice to use floats for money)
  
  attr_accessor :hours , :minutes , :fee
    
  def input_time_worked
    puts 'Enter the number of full hours worked'
    self.hours = gets.to_i
    puts 'Enter the number of minutes past the last hour'
    self.minutes = gets.to_i
  end
  
  def compute_fee( hours_worked , minutes_worked )
    minutes_worked += hours_worked * 60             # convert all time worked into minutes
    quarter_hours = minutes_worked / 15             # remember, when dividing 2 integers, the remainder will be truncated
    quarter_hours * RATE                            # the last line of a method will be returned even without explicitly stating return
  end
  
  def update_fee
    # invoking the setter defined by attr_accessor rather than directly touching the instance variable
    # self is the current object who this instance method is modifying
    # we put self in front of it so the interpreter knows we are invoking fee= rather than creating a local variable
    self.fee = compute_fee( hours , minutes )
  end
  
  def output_bill
    puts "Time worked:"
    puts "#{hours} hours and #{minutes} minutes"
    puts "Rate: $#{RATE} per quarter hour."
    puts "Amount Due $#{fee}"
  end
end


puts "Welcome to the law offices of"
puts "Dewy, Cheatham, and Howe."
your_bill = Bill.new
your_bill.input_time_worked
your_bill.update_fee
your_bill.output_bill
puts "We have placed a lien on your house."
puts "It has been our pleasure to serve you."