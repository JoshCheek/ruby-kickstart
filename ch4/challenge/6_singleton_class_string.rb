# In Ruby on Rails, when a person goes to a URL on your site, your application looks at the url, 
# and maps it to a controller method to handle the request
#
# My boss wanted to be able to specify what CSS class the body of the HTML output should have,
# based on which controller method was being accessed.
# It fell to me to provide a method, which, when invoked, would return a String that could handle the request
# 
# There are a few nuances, though.
# The String you return must be retained during the object's entire life
# The method must be able to be called multiple times
# The String you return should know how to add new classes: each class is separated by a space
# The only method you need to worry about being invoked is the << method.
#
# EXAMPLE:
#   controller = ApplicationController.new
#   controller.body_class                 # => ""
#   controller.body_class << 'admin'
#   controller.body_class                 # => "admin"
#   controller.body_class << 'category'
#   controller.body_class                 # => "admin category"
#   controller.body_class << 'page' << 'order'
#   controller.body_class                 # => "admin category page order"
#
#
# HINT: 
#   The concat method will do the same thing as the << method

class ApplicationController  
  def body_class
  end
end
