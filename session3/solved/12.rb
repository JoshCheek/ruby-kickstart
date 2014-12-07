def pay_by(order)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  yield
  order.ship_goods
end

def pay_by_visa(order, ccn)
  pay_by order do
    order.payment :type => :visa, :ccn => ccn
    order.verify_payment
  end
end

def pay_by_check(order)
  pay_by(order) { order.payment :type => :check, :signed => true }
end

def pay_by_cash(order)
  pay_by(order) { order.payment :type => :cash }
end

def pay_by_store_credit(order,current_user)
  pay_by order do
    order.payment :type => :store_credit
    current_user.store_credit -= order.cost
  end
end
