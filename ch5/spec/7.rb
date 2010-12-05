# commenting out b/c it doesn't work



# require 'rubygems'
# require 'hpricot'
# require 'open-uri'
# 
# def port
#   3001
# end
# 
# def root_url
#   "http://localhost:#{port}"
# end
# 
# 
# if $LOADED_FEATURES.grep(/2_blocks_var_args/).empty?
#   def path() File.join File.dirname(__FILE__) , '..' , 'solved' , '7.rb' end
# else
#   def path() File.join File.dirname(__FILE__) , '..' , 'challenge' , '7_sinatra.rb' end
# end
# 
# 
# 
# describe 'your sinatra app' do
# 
#   before :all do
#     @sinatra = thread.new do
#       %x(ruby #{path} -p #{port})
#     end
#     sleep 2
#   end
# 
#   after :all do
#     20.times {puts "CALLING AFTER ALL"}
#     @sinatra.kill!
#   end
# 
#   it 'should have a /calculate' do
#     puts Hpricot(open(root_url))
#   end
# 
# end
