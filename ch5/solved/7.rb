require 'rubygems'
require 'sinatra'

def multiline(*lines)
  lines.join '<br />'
end

def results( result )
  multiline result , '<a href="/calculator">Click Here</a> to go back.'
end

get '/' do
  redirect '/calculator'
end

get '/calculator' do
  multiline '<form action="/add" method="post">' ,
                '<input type="text" name="num1" size="3" />    +     <input type="text" name="num2" size="3" />     <input type="submit" value="add em" />' ,
            "</form>" ,
            
            '<form action="/subtract" method="post">' ,
                '<input type="text" name="num1" size="3" />     -     <input type="text" name="num2" size="3" />     <input type="submit" value="subtract em" />' ,
            "</form>" ,

            '<form action="/multiply" method="post">' ,
                '<input type="text" name="num1" size="3" />     *     <input type="text" name="num2" size="3" />     <input type="submit" value="multiply em" />' ,
            "</form>" ,

            '<form action="/divide" method="post">' ,
                '<input type="text" name="num1" size="3" />     /     <input type="text" name="num2" size="3" />     <input type="submit" value="divide em" />' ,
            "</form>" ,

            '<form action="/mod" method="post">' ,
                '<input type="text" name="num1" size="3" />     %     <input type="text" name="num2" size="3" />     <input type="submit" value="mod em" />' ,
            "</form>"

end


# Man this is a lot of boiler plate down here
# I wonder if there is any way we could get our results method to do this work for us
# By the way, you can invoke a method by passing a string or a symbol, just use send
# http://ruby-doc.org/core/classes/Object.html#M000332

post '/add' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  results "#{num1} + #{num2} = #{num1 + num2}"
end

post '/subtract' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  results "#{num1} - #{num2} = #{num1 - num2}"
end

post '/multiply' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  results "#{num1} * #{num2} = #{num1 * num2}"
end

post '/divide' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  results "#{num1} / #{num2} = #{num1 / num2}"
end

post '/mod' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  results "#{num1} % #{num2} = #{num1 % num2}"
end