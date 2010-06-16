
elements = Array.new

DATA.each do |line|
  if line !~ /^([^,]*), which ships at ([^,]*), cost:? (.*)$/
    puts "FAILED ON #{line}"
  end
  name , size , price = $1 , $2 , $3
  id = name.to_s.gsub(' ','')
  elements << [ id , price ]
  puts <<-END_OF_ROW.gsub(/^    /,'')
    <tr>
      <td>#{name}</td>
      <td>#{size}</td>
      <td align="right">#{price}</td>
      <td><input type="text" id="#{id}" size="2" onblur="validateQuantity(this,6);" value="0" /></td>
    </tr>
  END_OF_ROW
end

puts
require 'pp'
pp elements

__END__
American Redbud Tree, which ships at 1 to 2 feet, cost $5.95
Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95
Black Walnut Tree, which ships at 1 to 2 feet, cost: $4.95
Cherokee Chief Dogwood, which ships at 2 to 4 feet, cost: $8.95
English Walnut Tree, which ships at 1 to 2 feet, cost $10.95
Flowering Peach Tree, which ships at 2 to 4 feet, cost: $7.95
Flowering Pear Tree, which ships at 2 to 4 feet, cost: $8.50
Hydrangea Tree, which ships at 1 to 2 feet, cost: $5.95
Pecan Tree, which ships at 1 to 2 feet, cost: $5.95
Purple Leaf Plum Tree, which ships at 2 to 3 feet, cost: $5.95
Royal Empress Tree, which ships at 2 to 4 feet, cost: $4.50
White Dogwood Tree, which ships at 2 to 3 feet, cost: $5.95