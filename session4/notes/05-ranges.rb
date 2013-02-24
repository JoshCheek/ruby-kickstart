# ranges look like this
1..5            # => 1..5
1...5           # => 1...5

# 2 dots includes the end
(1..3).to_a     # => [1, 2, 3]

# 3 dots excludes the end
(1...3).to_a    # => [1, 2]



# They are iterable, using the methods in by Enumerable module
iterated = Array.new
(1..5).each { |n| iterated << n }
iterated                            # => [1, 2, 3, 4, 5]

(1...5).map { |n| n * 5 }           # => [5, 10, 15, 20]
('a'..'c').to_a                     # => ["a", "b", "c"]


# They make good arguments to things like arrays
[1,2,3,4,5][1..3]                   # => [2, 3, 4]


# You can use variables also
start = 10
stop  = 15
start..stop                         # => 10..15


# They're mostly useless, but you'll see them every now and
# then, so just be aware of what they are.
