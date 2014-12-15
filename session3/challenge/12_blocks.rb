# You have software to take payment from a customer
# There are 4 ways to pay, and they are all very similar.
# One day, you are paying by cash, and you realize you never calculated the tax!
# So you went in to your code and added order.compute_tax to the pay_by_cash method.
# Everything was great, until you realized you forgot to add it to pay_by_check also!
#
# You fixed this bug already, but the same code is duplicated in many places,
# so the bug fix didn't get everything. Frustrated, you decide to refactor your code.
#
# You see a lot of duplciation, but unfortunately, right in the middle of each of these
# pieces of code, is a line or two that changes every time.
#
# Thinking a little bit, you realize that you could create a method that performs this
# boiler plate code, then calls a block which does the custom code.
#
# You decide to name it pay_by.
#
# **Create the pay_by method, and refactor each of the four methods below such that they
# invoke the pay_by method, and pass it the order, to take care of the code that is all the same
# Let them pass a block to take care of the code that is unique.**
#
# NOTE: This code will only work with the rake tests, which will define the order and current_user
# you will not be able to run this code outside of the test


def pay_by_visa(order, ccn)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  order.payment :type => :visa, :ccn => ccn
  order.verify_payment
  order.ship_goods
end

def pay_by_check(order)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  order.payment :type => :check, :signed => true
  order.ship_goods
end

def pay_by_cash(order)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  order.payment :type => :cash
  order.ship_goods
end

def pay_by_store_credit(order)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  order.payment :type => :store_credit
  current_user.store_credit -= order.cost   # current_user is a method with no params (ie, the customer)
  order.ship_goods
end
