require File.join( File.dirname(__FILE__) , 'helper' )

RSpec.describe 'deaf_grandma' do
  def call_deaf_grandma(input=String.new)
    input << "\nBYE\n"
    input_output(input) { deaf_grandma }.split("\n")
  end

  huh = 'HUH?! SPEAK UP, SONNY!'.freeze
  no  = 'NO, NOT SINCE 1938!'.freeze

  it 'has no output when the only input is BYE' do
    output = input_output("BYE\n") { deaf_grandma }
    expect(output).to eq String.new
  end

  it "says #{huh} when given a blank line" do
    expect(call_deaf_grandma).to eq [huh]
  end

  it "says #{huh} when asked 'how are you?'" do
    expect(call_deaf_grandma 'how are you?').to eq [huh]
  end

  it "says huh, no, huh for input 'hi grandma.', 'HI GRANDMA!', 'bye', 'BYE'" do
    expect(call_deaf_grandma "hi grandma.\nHI GRANDMA\nbye").to eq [huh,no,huh]
  end

  it "says #{huh}, three times, for 'what was the war like?' three times" do
    query = Array.new(3) { "what was the war like?" }.join("\n")
    expect(call_deaf_grandma query).to eq [huh] * 3
  end

  it 'answers huh, no, for every set of questions asked in lowercase then uppercase' do
    questions = <<-QUESTIONS.gsub(/^\s+/,'').split("\n").map { |question| [question , question.upcase] }.flatten
    How is the wheather?
    What is your favourite movie?
    Do you eat cheesecake?
    Where did you get those earrings?
    My mom says she never told any lies, is that true or is she a liar?
    How do you get your garden so green?
    QUESTIONS
    result = [huh , no] * (questions.size / 2)
    expect(call_deaf_grandma questions.join("\n")).to eq result
  end
end
