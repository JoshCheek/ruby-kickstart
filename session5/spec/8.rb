gemlist = %x(gem list)

describe 'gem installation' do

  specify "you should have rubygems running (if you're on 1.8, try `require 'rubygems'`)" do
    Object.const_get('Gem').should be
  end
    
  specify 'you should have installed helloworld' do    
    gemlist.should =~ /\bhelloworld\b/
  end
  
  specify 'you should have required hello_world' do
    Object.const_get('HelloWorld').should be
  end
  
  specify 'you should have installed sinatra' do
    gemlist.should =~ /\bsinatra\b/
  end
  
  specify 'you should ahve required sinatra' do
    Object.const_get('Sinatra').should be
  end
  
  specify 'you should have installed nokogiri' do
    gemlist.should =~ /\bnokogiri\b/
  end
  
  specify 'you should have required nokogiri' do
    Object.const_get('Nokogiri').should be
  end
  
  
end