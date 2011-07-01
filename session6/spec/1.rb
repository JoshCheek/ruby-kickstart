if $LOADED_FEATURES.grep(/session6\/solved\/1/).empty?
  app_root = File.expand_path "#{File.dirname __FILE__}/../challenge/1_build_an_app"
else
  app_root = File.expand_path "#{File.dirname __FILE__}/../solved/1_build_an_app"
end

main = self

# check necessary preliminaries
def unrecoverable_error(message)
  message     =  "* #{message} *"
  border      =  message.gsub(/./,'*')
  blank_line  = ''
  puts blank_line, border, message, border, blank_line
  exit 1
end

begin
  require "#{app_root}/main"
rescue LoadError
  unrecoverable_error "You should have a main file in in challenge/1_build_an_app/main.rb"
end

begin
  Sinatra
rescue
  unrecoverable_error "You should have required Sinatra from your main file."
end

begin
  require "webrat"
rescue LoadError
  unrecoverable_error 'You need to install webrat `$ gem install webrat` (for testing).'
end

begin
  require 'rack/test'
rescue LoadError
  unrecoverable_error "You need to install rack-test `$ gem install rack-test`"
end



# Set up the environment
set :show_exceptions, false
module MyHelpers
  def app
    Sinatra::Application
  end
end

Webrat.configure do |config|
  config.mode = :rack
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Webrat::Methods
  config.include Webrat::Matchers
  config.include MyHelpers
end




# Test the app
describe "Your application's library" do
  specify 'should be in a folder named lib/caesar_cipher.rb' do
    File.should exist "#{app_root}/lib/caesar_cipher.rb"
    require "#{app_root}/lib/caesar_cipher"
  end
    
  specify 'Should be in a module named CaesarCipher' do
    Object.should be_const_defined(:CaesarCipher)
    CaesarCipher.should be_instance_of Module
  end
    
  describe 'CaesarCipher.encrypt' do
    describe 'with a lowercase message' do
      specify { CaesarCipher.encrypt('a').should == 'd' }
      specify { CaesarCipher.encrypt('b').should == 'e' }
      specify { CaesarCipher.encrypt('x').should == 'a' }
      specify { CaesarCipher.encrypt('z').should == 'c' }
    end
    describe 'with an uppercase message' do
      specify { CaesarCipher.encrypt('A').should == 'D' }
      specify { CaesarCipher.encrypt('B').should == 'E' }
      specify { CaesarCipher.encrypt('X').should == 'A' }
      specify { CaesarCipher.encrypt('Z').should == 'C' }
    end
    describe 'with a numerical message' do
      specify { CaesarCipher.encrypt('0').should == '3' }
      specify { CaesarCipher.encrypt('1').should == '4' }
      specify { CaesarCipher.encrypt('7').should == '0' }
      specify { CaesarCipher.encrypt('9').should == '2' }
    end
    describe 'with non alphanumeric message' do
      '~!@#$%^&*(){}[];\':",./\\ '.each_char do |char|
        specify { CaesarCipher.encrypt(char.dup).should == char }
      end
    end
    describe 'with a full message' do
      specify do
        CaesarCipher.encrypt("The quick brown fox jumps over the lazy dog.").should == 
          "Wkh txlfn eurzq ira mxpsv ryhu wkh odcb grj."
      end
    end
  end

  describe 'CaesarCipher.decrypt' do
    describe 'with a lowercase message' do
      specify { CaesarCipher.decrypt('d').should == 'a' }
      specify { CaesarCipher.decrypt('e').should == 'b' }
      specify { CaesarCipher.decrypt('a').should == 'x' }
      specify { CaesarCipher.decrypt('c').should == 'z' }
    end
    describe 'with an uppercase message' do
      specify { CaesarCipher.decrypt('D').should == 'A' }
      specify { CaesarCipher.decrypt('E').should == 'B' }
      specify { CaesarCipher.decrypt('A').should == 'X' }
      specify { CaesarCipher.decrypt('C').should == 'Z' }
    end
    describe 'with a numerical message' do
      specify { CaesarCipher.decrypt('3').should == '0' }
      specify { CaesarCipher.decrypt('4').should == '1' }
      specify { CaesarCipher.decrypt('0').should == '7' }
      specify { CaesarCipher.decrypt('2').should == '9' }
    end
    describe 'with non alphanumeric message' do
      '~!@#$%^&*(){}[];\':",./\\ '.each_char do |char|
        specify { CaesarCipher.decrypt(char.dup).should == char }
      end
    end
    describe 'with a full message' do
      specify do
        CaesarCipher.decrypt("Wkh txlfn eurzq ira mxpsv ryhu wkh odcb grj.").should ==
          "The quick brown fox jumps over the lazy dog."
      end
    end
  end
end
  

describe "Your application's Gemfile" do
  specify { File.should exist "#{app_root}/Gemfile" }
  it 'should have a source of :rubygems' do
    main.should_receive(:source).with(:rubygems).once
    main.stub! :gem
    load "#{app_root}/Gemfile"
  end
  it 'should have a line for Sinatra' do
    main.stub! :source
    main.stub! :gem
    main.should_receive(:gem).with('sinatra', '~> 1.2.6').once
    load "#{app_root}/Gemfile"
  end
  it 'should have a line for rack-test' do
    main.stub! :source
    main.stub! :gem
    main.should_receive(:gem).with('rack-test', '~> 0.6.0').once
    load "#{app_root}/Gemfile"
  end
end


describe "Your application's Gemfile.lock" do
  it 'should have been installed to a Gemfile.lock' do
    File.should exist "#{app_root}/Gemfile.lock"
  end
  it 'should have a line for Sinatra' do
    File.readlines("#{app_root}/Gemfile.lock").grep(/\bsinatra\b/).should_not be_empty
  end
  it 'should have a line for rack-test' do
    File.readlines("#{app_root}/Gemfile.lock").grep(/\brack-test\b/).should_not be_empty
  end
end
  

shared_examples_for "every page" do  
  specify 'and have an html tag' do
    response.should have_selector 'html'
  end
  specify 'and have a head tag' do
    response.should have_selector 'html head'
  end
  specify 'and have an title of "Caesar Cipher"' do
    within('html head title') { |title| title.should contain "Caesar Cipher" }
  end
  specify 'and have a body tag' do
    response.should have_selector 'html body'
  end
  specify 'and have an h1 with the text "Caesar Cipher"' do
    response.should have_selector 'h1'
    within('html body h1') { |h1| h1.should contain "Caesar Cipher" }
  end
end



describe "Your application's '/' route" do
  before  { visit '/' }
  specify { last_response.should be_ok }
  
  it_should_behave_like "every page"
  
  describe "'s form to encrypt" do
    it "should post to '/encrypt'" do
      response.should have_selector 'form[method="post"][action="/encrypt"]'
    end
    it "should have an input of type 'text' and name 'message'" do
      response.should have_selector 'form[action="/encrypt"] input[type="text"][name="message"]'
    end
    it "should have an input of type 'submit' and value 'encrypt'" do
      response.should have_selector 'form[action="/encrypt"] input[type="submit"][value="encrypt"]'
    end
  end
  
  describe "'s form to decrypt" do
    it "should post to '/decrypt'" do
      response.should have_selector 'form[method="post"][action="/decrypt"]'
    end
    it "should have an input of type 'text' and name 'message'" do
      response.should have_selector 'form[action="/decrypt"] input[type="text"][name="message"]'
    end
    it "should have an input of type 'submit' and value 'decrypt'" do
      response.should have_selector 'form[action="/decrypt"] input[type="submit"][value="decrypt"]'
    end
  end
end


describe "Posting to your application's '/encrypt' route" do
  before { visit '/encrypt', :post, :message => "Abcd." }
  specify { last_response.should be_ok }
  it_should_behave_like "every page"
  it %Q{should have a paragraph saying '"Abcd." encrypts to "Defg."'} do
    within('p') { |p| p.should contain '"Abcd." encrypts to "Defg."' }
  end
  it 'should have a link to "/", with the text "Back"' do
    within('a[href="/"]') { |a| a.should contain "Back" }
  end
end


describe "Posting to your application's '/decrypt' route" do
  before { visit '/decrypt', :post, :message => "Defg." }
  specify { last_response.should be_ok }
  it_should_behave_like "every page"
  it %Q{should have a paragraph saying '"Defg." decrypts to "Abcd."'} do
    within('p') { |p| p.should contain '"Defg." decrypts to "Abcd."' }
  end
  it 'should have a link to "/", with the text "Back"' do
    within('a[href="/"]') { |a| a.should contain "Back" }
  end
end


describe "Your application's config.ru" do
  it 'should exist' do
    File.should exist "#{app_root}/config.ru"
  end
  it "should require main.rb" do
    main.should_receive(:require).with("#{app_root}/main")
    main.stub! :run
    load "#{app_root}/config.ru"
  end
  it "should run Sinatra::Application" do
    main.stub! :require
    main.should_receive(:run).with(Sinatra::Application)
    load "#{app_root}/config.ru"
  end  
end


describe do
  specify do
    at_exit do
      puts '', <<-MESSAGE
        Great job! I'd add tests for github, but honestly, I don't know how to :/
        Anyway, go ahead and put it under git source control and put it on Heroku :)
       
        This is our last challenge together, I hope you've enjoyed it!
      MESSAGE
    end
  end
end
