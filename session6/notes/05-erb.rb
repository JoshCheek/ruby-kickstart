# Web sites use a language called HTML to organize what a site
# should look like on a page (I'm not going to cover HTML, if you
# want to learn about it, consider http://htmldog.com).

# The best way to write HTML that needs to be dynamic is to use a
# templating language like ERB, this lets us embed our Ruby right
# into the html.
shopping_cart = ['lamp', 'desk', 'pencils']
template = "
<ul>
  <% shopping_cart.each do |item| %>
    <li><%= item %></li>
  <% end %>
</ul>
"

# For lines where you don't want to keep the output, like the line
# that iterates over the shopping cart, you put your Ruby inside <% %>
# tags. For lines where you want to embed the output, put your code
# inside of <%= %> tags.

require 'erb'
puts ERB.new(template).result
# >>
# >> <ul>
# >>
# >>     <li>lamp</li>
# >>
# >>     <li>desk</li>
# >>
# >>     <li>pencils</li>
# >>
# >> </ul>
