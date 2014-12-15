if $LOADED_FEATURES.grep(/session6\/solved\/1/).empty?
  app_root = File.expand_path "../../challenge/1_build_an_app", __FILE__
else
  app_root = File.expand_path "../../solved/1_build_an_app", __FILE__
end

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
rescue => e
  unrecoverable_error "You should have required Sinatra from your main file."
end

begin
  require "capybara/rspec"
rescue LoadError
  unrecoverable_error 'You need to install capybara `$ gem install capybara` (for testing).'
end

begin
  require 'rack/test'
rescue LoadError
  unrecoverable_error "You need to install rack-test `$ gem install rack-test`"
end



# Set up the environment
set :show_exceptions, false
module MyHelpers
  extend self

  def app
    Sinatra::Application
  end

  def assert(bool)
    expect(bool).to eq true
  end

  def main
    TOPLEVEL_BINDING.eval('self')
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include MyHelpers
  config.disable_monkey_patching!
end

Capybara.app = MyHelpers.app
class Capybara::Session
  # Super displeased with this solution.
  # There is `page.driver.post`, but that doesn't update the browser's DOM, which took me fkn *hours* to figure out
  # (b/c page.body is correct, and code passes self to fkn everything... seriously, probably 4+ hours over multiple days)
  # I would drop to rack-test and Nokogiri, but the shared assertions expect to be using Capybara.
  def post(url, data={})
    driver.browser.reset_host!
    driver.browser.process_and_follow_redirects :post, url, data
  end
end


# Test the app
RSpec.describe "Your application's library" do
  specify 'is be in a folder named lib/caesar_cipher.rb' do
    assert File.exist?("#{app_root}/lib/caesar_cipher.rb")
    require "#{app_root}/lib/caesar_cipher"
  end

  specify 'Should be in a module named CaesarCipher' do
    expect(CaesarCipher).to be_an_instance_of Module
  end

  describe 'CaesarCipher.encrypt' do
    def self.assert_encrypts(encryptions)
      encryptions.each do |key, value|
        specify("#{key.inspect} encrypts to #{value.inspect}") do
          expect(CaesarCipher.encrypt key).to eq value
        end
      end
    end
    describe 'with a lowercase message' do
      assert_encrypts 'a' => 'd',
                      'b' => 'e',
                      'x' => 'a',
                      'z' => 'c'
    end
    describe 'with an uppercase message' do
      assert_encrypts 'A' => 'D',
                      'B' => 'E',
                      'X' => 'A',
                      'Z' => 'C'
    end
    describe 'with a numerical message' do
      assert_encrypts '0' => '3',
                      '1' => '4',
                      '7' => '0',
                      '9' => '2'
    end
    describe 'with non alphanumeric message' do
      '~!@#$%^&*(){}[];\':",./\\ '.each_char do |char|
        specify { expect(CaesarCipher.encrypt char.dup).to eq char }
      end
    end
    describe 'with a full message' do
      specify do
        expect(CaesarCipher.encrypt "The quick brown fox jumps over the lazy dog.")
          .to eq "Wkh txlfn eurzq ira mxpsv ryhu wkh odcb grj."
      end
    end
  end

  describe 'CaesarCipher.decrypt' do
    def self.assert_decrypts(decryptions)
      decryptions.each do |key, value|
        specify("#{key.inspect} decrypts to #{value.inspect}") do
          expect(CaesarCipher.decrypt key).to eq value
        end
      end
    end
    describe 'with a lowercase message' do
      assert_decrypts 'd' => 'a',
                      'e' => 'b',
                      'a' => 'x',
                      'c' => 'z'
    end
    describe 'with an uppercase message' do
      assert_decrypts 'D' => 'A',
                      'E' => 'B',
                      'A' => 'X',
                      'C' => 'Z'
    end
    describe 'with a numerical message' do
      assert_decrypts '3' => '0',
                      '4' => '1',
                      '0' => '7',
                      '2' => '9'
    end
    describe 'with non alphanumeric message' do
      '~!@#$%^&*(){}[];\':",./\\ '.each_char do |char|
        assert_decrypts char.dup => char
      end
    end
    describe 'with a full message' do
      assert_decrypts "Wkh txlfn eurzq ira mxpsv ryhu wkh odcb grj." =>
                      "The quick brown fox jumps over the lazy dog."
    end
  end
end


RSpec.describe "Your application's Gemfile" do
  specify { assert File.exist?("#{app_root}/Gemfile") }
  it 'has a source of "https://rubygems.org' do
    expect(main).to receive(:source).with("https://rubygems.org").once
    allow(main).to receive :gem
    load "#{app_root}/Gemfile"
  end
  it 'has a line for Sinatra' do
    allow(main).to receive :source
    allow(main).to receive :gem
    expect(main).to receive(:gem).with('sinatra', '~> 1.4').once
    load "#{app_root}/Gemfile"
  end
  it 'has a line for rack-test' do
    allow(main).to receive :source
    allow(main).to receive :gem
    expect(main).to receive(:gem).with('rack-test', '~> 0.6').once
    load "#{app_root}/Gemfile"
  end
end


RSpec.describe "Your application's Gemfile.lock" do
  it 'has been installed to a Gemfile.lock' do
    assert File.exist?("#{app_root}/Gemfile.lock")
  end
  it 'has a line for Sinatra' do
    lines = File.readlines("#{app_root}/Gemfile.lock").grep(/\bsinatra\b/)
    expect(lines).to_not be_empty
  end
  it 'has a line for rack-test' do
    lines = File.readlines("#{app_root}/Gemfile.lock").grep(/\brack-test\b/)
    expect(lines).to_not be_empty
  end
end


RSpec.shared_examples_for "every page" do
  specify 'and have an html tag' do
    expect(page).to have_css 'html'
  end
  specify 'and have a head tag' do
    expect(page).to have_css 'html head', visible: false
  end
  specify 'and have an title of "Caesar Cipher"' do
    title = page.find 'html head title', visible: false
    expect(title.text :all).to include 'Caesar Cipher' # :all makes it work with hidden elements
  end
  specify 'and have a body tag' do
    expect(page).to have_css 'html body'
  end
  specify 'and have an h1 with the text "Caesar Cipher"' do
    h1 = page.find 'html body h1'
    expect(h1).to have_text 'Caesar Cipher'
  end
end



RSpec.describe "Your application's '/' route", type: :feature do
  before  { page.visit '/' }
  specify { expect(page.status_code).to eq 200 }

  it_behaves_like "every page"

  describe "has a form that posts to encrypt" do
    it "posts to '/encrypt'" do
      expect(page).to have_selector 'form[method="post"][action="/encrypt"]'
    end
    it "has an input of type 'text' and name 'message'" do
      expect(page).to have_selector 'form[action="/encrypt"] input[type="text"][name="message"]'
    end
    it "has an input of type 'submit' and value 'encrypt'" do
      expect(page).to have_selector 'form[action="/encrypt"] input[type="submit"][value="encrypt"]'
    end
  end

  describe "has a form to decrypt" do
    it "has to '/decrypt'" do
      expect(page).to have_selector 'form[method="post"][action="/decrypt"]'
    end
    it "has an input of type 'text' and name 'message'" do
      expect(page).to have_selector 'form[action="/decrypt"] input[type="text"][name="message"]'
    end
    it "has an input of type 'submit' and value 'decrypt'" do
      expect(page).to have_selector 'form[action="/decrypt"] input[type="submit"][value="decrypt"]'
    end
  end
end

RSpec.describe "Posting to your application's '/encrypt' route", type: :feature do
  before { page.post '/encrypt', message: 'Abcd.' }
  specify { expect(page.status_code).to eq 200 }
  it_behaves_like "every page"
  it %Q{has a paragraph saying '"Abcd." encrypts to "Defg."'} do
    paragraphs = page.all('p').map(&:text).join
    expect(paragraphs).to include '"Abcd." encrypts to "Defg."'
  end
  it 'has a link to "/", with the text "Back"' do
    expect(page.find 'a[href="/"]').to have_text "Back"
  end
end


RSpec.describe "Posting to your application's '/decrypt' route", type: :feature do
  before { page.post '/decrypt', message: "Defg." }
  specify { expect(page.status_code).to eq 200 }
  it_behaves_like "every page"
  it %Q{has a paragraph saying '"Defg." decrypts to "Abcd."'} do
    paragraphs = page.all('p').map(&:text).join
    expect(paragraphs).to include '"Defg." decrypts to "Abcd."'
  end
  it 'has a link to "/", with the text "Back"' do
    expect(page.find 'a[href="/"]').to have_text "Back"
  end
end


RSpec.describe "Your application's config.ru" do
  it 'exists' do
    assert File.exist?("#{app_root}/config.ru")
  end
  it "requires main.rb" do
    expect(main).to receive(:require).with("#{app_root}/main")
    allow(main).to receive :run
    load "#{app_root}/config.ru"
  end
  it "runs Sinatra::Application" do
    allow(main).to receive :require
    expect(main).to receive(:run).with(Sinatra::Application)
    load "#{app_root}/config.ru"
  end
end


RSpec.describe do
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
