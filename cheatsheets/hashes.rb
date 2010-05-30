# http://ruby-doc.org/core/classes/Hash.html


# =====  Initializing  =====
# populated
{ 1 => 'one' , 2 => 'two' } # => {1=>"one", 2=>"two"}
Hash[ 1,'one' , 2,'two' ]   # => {1=>"one", 2=>"two"}

# empty
{}                          # => {}
Hash.new                    # => {}


# =====  Nonexistent Keys  =====
# by default, nonexistent keys return nil
hash = Hash.new   # => {}
hash[:josh]       # => nil

# to change this behaviour, you can pass new a block that receives the hash and the nonexistent key
# and then adds it to the hash in the way that you would like
aliases = Hash.new { |hash,key| hash[key] = Array.new }
aliases         # => {}
aliases[:josh]  # => []
aliases         # => {:josh=>[]}
aliases[:jeff] << 'the dude' << 'his dudeness' << 'duder' << 'el duderino'
aliases         # => {:jeff=>["the dude", "his dudeness", "duder", "el duderino"], :josh=>[]}

# you can alternatively pass as a parameter whatever object you would like, and it will be returned if there is no key.
# Be careful, though, it is the same object every time, so if you mutate it, it won't do what you expect
sums = Hash.new 5
sums                 # => {}
sums[:evens]         # => 5
sums                 # => {}
sums[:evens] += 1
sums                 # => {:evens=>6}

