require File.join( File.dirname(__FILE__) , 'helper' )

def call_deaf_grandma( input=String.new )
  input_output( input << "\nBYE\n" ) { deaf_grandma }.split("\n")
end

huh = 'HUH?! SPEAK UP, SONNY!'
no  = 'NO, NOT SINCE 1938!'  

describe 'deaf_grandma' do
  
  it 'should have no output when the only input is BYE' do
    input_output("BYE\n") { deaf_grandma }.should == String.new
  end

  it "should say #{huh} when given a blank line" do
    call_deaf_grandma.should == [huh]
  end
  
  it "should say #{huh} when asked 'how are you?'" do
    call_deaf_grandma('how are you?').should == [huh]
  end
  
  it "should say huh, no, huh for input 'hi grandma.', 'HI GRANDMA!', 'bye', 'BYE'" do
    call_deaf_grandma("hi grandma.\nHI GRANDMA\nbye").should == [huh,no,huh]
  end
  
  it "should say huh, three times, for 'what was the war like?' three times" do
    query = ( ["what was the war like?"] * 3 ).join "\n"
    call_deaf_grandma(query).should == [huh] * 3
  end
  
  it 'should answer huh, no, for every set of questions asked in lowercase then uppercase' do
    questions = <<-QUESTIONS.gsub(/^\s+/,'').split("\n").map { |question| [ question , question.upcase ] }.flatten
    How is the wheather?
    What is your favourite movie?
    Do you eat cheesecake?
    Where did you get those earrings?
    My mom says she never told any lies, is that true or is she a liar?
    How do you get your garden so green?
    QUESTIONS
    call_deaf_grandma(questions.join "\n").should == [ huh , no ] * (questions.size / 2)
  end
  
end