# You can set elements into a hash table with hash[key] = value
hash = {}
hash[:number] = 12
hash[:colour] = 'black'
hash                      # => {:number=>12, :colour=>"black"}


# You can get them back out with hash[key]
hash[:number]             # => 12
hash[:colour]             # => "black"


# You can change its value by setting it again
hash[:colour]             # => "black"
hash[:colour] = :black
hash[:colour]             # => :black


# If you access a nonexistent element, nil is returned
hash[:yay_for_pirates!]   # => nil


# If it makes more sense for your hash, you can change
# what it returns for nonexistent keys by passing it
# a block that will be invoked when a mising key is requested.
character_counts = Hash.new { |this_hash, key| this_hash[key] = 0 }
character_counts["a"]     # => 0
character_counts          # => {"a"=>0}

"abcbcbababcbcx".each_char do |char|
  character_counts[char] += 1
end

character_counts # => {"a"=>3, "b"=>6, "c"=>4, "x"=>1}
