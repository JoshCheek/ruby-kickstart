def deaf_grandma
  while line = gets
     line.chomp!
     if line == 'BYE'
       break
     elsif line =~ /[a-z]/ || line.empty?
       puts 'HUH?! SPEAK UP, SONNY!'
     else
       puts 'NO, NOT SINCE 1938!'
     end
  end
end






deaf_grandma if $0 == __FILE__ # this will call your code so you can run it from the terminal