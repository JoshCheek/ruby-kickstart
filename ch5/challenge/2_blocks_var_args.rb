# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  THIS IS A CONTINUATION OF CHALLENGE 1                                  #
#  YOU MUST HAVE CHALLENGE ONE PASSING BEFORE ATTEMPTING THIS CHALLENGE   #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# My boss can now add CSS classes from his controller, so he is happy.
# But there are a lot of controller methods, and so he has to go to a lot of different 
# places and type things like body_class << 'admin'
# 
# That is pretty redundant and not dry. It makes code confusing to read, so Rails has
# something called filters. My boss decided to use a before filter to set the CSS classes
# 
# In his controller, he told Rails:
# before_filter :set_admin , :except => [ :show , :index ]
#
# Then he created the method
# def set_admin
#   body_class << 'admin'
# end
#
# Rails now knows that when an HTTP request is going to be handled by this controller,
# if the controller method handling the request is anything other than the methods named show and index
# that it should first invoke the set_admin method. And in that method, he sets the CSS class.
# 
#
#
# The problem, is that there are several of these of these filters he wants to apply,
# and he wants to do it in _every_ controller. There are many controllers, and many classes
# and so this amounts to lots and lots of very redundant and simple code. So he called me over
# and says that he would like to be able to accomplish the same thing with just one line of code:
#
# css_classes 'admin' , :except => [ :show , :index ]
#
#
# I looked at the documentation, and the before_filter can take a block instead of a method name
# It will pass in the controller being operated on, so you could instead write the before filter like this:
#
# before_filter :except => [ :show , :index ] do |controller|
#   controller.body_class << css_class
# end
#
#
# Write the css_classes method.
#
# EXAMPLE INVOCATIONS:

#  