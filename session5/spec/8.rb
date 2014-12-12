gemlist = %x(gem list)

RSpec.describe 'gem installation' do
  specify "rubygems is running (if you're on 1.8, try `require 'rubygems'`)" do
    expect { Gem }.to_not raise_error
  end

  specify 'helloworld gem is installed' do
    expect(gemlist).to match /\bhelloworld\b/
  end

  specify 'helloworld gem is required' do
    expect { HelloWorld }.to_not raise_error
  end

  specify 'sinatra gem is installed' do
    expect(gemlist).to match /\bsinatra\b/
  end

  specify 'sinatra gem is required' do
    expect { Sinatra }.to_not raise_error
  end

  specify 'nokogiri gem is installed' do
    expect(gemlist).to match /\bnokogiri\b/
  end

  specify 'nokogiri gem is required' do
    expect { Nokogiri }.to_not raise_error
  end
end
