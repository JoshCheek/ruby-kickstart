app_root = File.expand_path "#{File.dirname __FILE__}/../challenge/1_build_an_app"
$LOAD_PATH << app_root

def unrecoverable_error(message)
  message     =  "* #{message} *"
  border      =  message.gsub(/./,'*')
  blank_line  = ''
  puts blank_line, border, message, border, blank_line
  exit 1
end

# check necessary preliminaries
begin
  require 'main'
rescue LoadError
  unrecoverable_error "You should have a main file in in challenge/1_build_an_app/main.rb"
end

begin
  Sinatra
rescue
  unrecoverable_error "You should have required Sinatra from your main file."
end

begin
  require 'rack/test'
rescue LoadError
  unrecoverable_error "rack-test should be required and configurable"
  exit 1
end


# set env for testing
include Rack::Test::Methods
set :environment, :test


# test actual app
describe "Your application's library" do
  specify 'should be in a folder named lib/caesar_cipher.rb' do
    require('lib/caesar_cipher').should be
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
    File.readlines("#{app_root}/Gemfile").grep(/\bsource\b.*:rubygems\b/).size.should == 1
  end
  it 'should have a line for Sinatra' do
    File.readlines("#{app_root}/Gemfile").grep(/(['"])sinatra\1/).size.should == 1
  end
  it 'should have a line for rack-test' do
    File.readlines("#{app_root}/Gemfile").grep(/(['"])rack-test\1/).size.should == 1
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
  

describe "Your application's main app" do
  def app
    Sinatra::Application
  end
  describe "'s '/encrypt' route" do
    before  { get '/encrypt' }
    specify { last_response.should be_ok }
  end
end
