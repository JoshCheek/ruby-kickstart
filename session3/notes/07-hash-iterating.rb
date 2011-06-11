# in 1.8, HASHES ARE NOT ORDERED, if you iterate through them,
# you don't know what order they will be passed
# in 1.9, they will passed to your block in the order they were inserted.


# When you iterate over the hash, you pass it a block, just like
# arrays. But this block takes two arguments, the key and value
student_ids = {'Bill' => 25, 'Danya' => 15, 'Mei' => 12}

student_ids.each do |student, id|
  puts "#{student}'s student id is #{id}"
end
# >> Bill's student id is 25
# >> Danya's student id is 15
# >> Mei's student id is 12
