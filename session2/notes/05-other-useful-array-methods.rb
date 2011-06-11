chars = ['a', 'b', 'c']


# Concatenate with +
chars + ['d', 'e'] # => ["a", "b", "c", "d", "e"]


# Append to an array
chars # => ["a", "b", "c"]
chars << 'd'
chars # => ["a", "b", "c", "d"]


# Replace
chars[1] = 'Bee'
chars # => ["a", "Bee", "c", "d"]


# Delete index
chars.delete_at 1
chars # => ["a", "c", "d"]


# Delete object
chars.delete 'c'
chars # => ["a", "d"]


# Insert
index = 1
chars.insert index, 'b' , 'c'
chars # => ["a", "b", "c", "d"]


# Sorting
['c', 'b', 'd', 'a'].sort # => ["a", "b", "c", "d"]
