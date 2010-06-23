# http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html # !> instance variable @num not initialized

# =====  About  =====
# ERB stands for Embedded Ruby
# It is in the standard library, meaning not a gem, so you can require it like so:
require 'erb'

# It is pretty easy to use, and is the default for most Ruby things that require templates (Rails, Sinatra, etc)
# It is embedded within Strings (ie files, local strings, etc) and once evaluated, is removed leaving only what you desire



# =====  <% Syntax: Control Structures %>  =====
# there are, amazingly enough, only two types of syntax for ERB (unless you want to get complicated -- which, you don't)
# 
# Control structures are embedded within <% %> tags. Inside of them, you place regular Ruby. It gets evaluated like normal
def get_result(str) ERB.new( str , 0 , '>' ).result end
get_result "123<% 10.times do %>4<% end %>567"  # => "1234444444444567"
get_result "123<% if true %>4444<% end %>567"   # => "1234444567"
get_result "123<% if false %>4444<% end %>567"  # => "123567"



# =====  <%= Syntax: Output %>  =====
# The second type of syntax is <%= %> tags.
# They are like <% %> except that they will drop into the template, whatever they return
get_result "123<%= '4444' %>567"          # => "1234444567"
get_result "123<%= 'erb'.upcase %>567"    # => "123ERB567"
products = %w(shoes shirts pants)
str =  <<TEMPLATE
<% products.each do |product| %>
Want to buy <%= product.upcase %>?
<% end %>
TEMPLATE
get_result str # => "Want to buy SHOES?\nWant to buy SHIRTS?\nWant to buy PANTS?\n"



# =====  It Can't See My Variables  =====
# there are some weird binding situations that can occur when using ERB
# If your binding is such that ERB can't see your local variables, usually the
# solution will be to make them instance variables.
str = '<%if @num%>My favourite number is <%=@num%><%else%>I have no favourite number<%end%>'
get_result str # => "I have no favourite number"
@num = 12
get_result str # => "My favourite number is 12"



# =====  What About The Arguments?  =====
# generally, whatever framework you're using ERB with will take care of them.
# but if you want to know more... read the docs ^_^
