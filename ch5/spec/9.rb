def make_regex(*elements)
  elements.flatten!
  /^\s*#{elements.join '\s*'}\s*$/
end

class String
  def should_match_tree( name , smallsize , bigsize , price)
    (split("\n").size % 6).should == 0
    split("\n").each_cons 6 do |one,two,three,four,five,six|
      one.should    =~ make_regex( %w{<tr >}                                                                                                               )
      two.should    =~ make_regex( %w{<td >}   , name.split  , %w{</td >}                                                                                  )
      three.should  =~ make_regex( %w{<td >}   , smallsize , 'to' , bigsize , %w{feet </td >}                                                              )
      four.should   =~ make_regex( %w{<td align = ("|')right\1 > \$} , price , %w{</td >}                                                                  )
      five.should   =~ make_regex( %w{<td > <input type = ("|')text\1 id = ("|')} , name.split.join , %w{\2 size = ("|')2\3 value = ("|')0\4 / > </td >}   )
      six.should    =~ make_regex( %w{</tr >}                                                                                                              )
    end
  end
end

describe 'tableize' do
  
  it 'one tree should span 6 lines' do
    tableize("American Redbud Tree, which ships at 1 to 2 feet, cost $5.95").split("\n").size.should == 6
  end
  
  it 'should work for a single tree in a string' do
    tableize("American Redbud Tree, which ships at 1 to 2 feet, cost $5.95").should_match_tree 'American Redbud Tree' , 1 , 2 , 5.95
  end
  
end
#
#   INVOCATION:
#     tableize(["Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95" ,
#               "Black Walnut Tree, which ships at 1 to 2 feet, cost: $4.95"       ])
#   RETURNS:
#     <tr>
#       <td>Autumn Flowering Cherry</td>
#       <td>2 to 4 feet</td>
#       <td align="right">$8.95</td>
#       <td><input type="text" id="AutumnFloweringCherry" size="2" value="0" /></td>
#     </tr>
#     <tr>
#       <td>Black Walnut Tree</td>
#       <td>1 to 2 feet</td>
#       <td align="right">$4.95</td>
#       <td><input type="text" id="BlackWalnutTree" size="2" value="0" /></td>
#     </tr>
#
#  INVOCATION:
#    (note, file named "tree.txt" contains only the single line "Cherokee Chief Dogwood, which ships at 2 to 4 feet, cost: $8.95")
#    tableize("tree.txt")
#  RETURNS:
#    <tr>
#      <td>Cherokee Chief Dogwood</td>
#      <td>2 to 4 feet</td>
#      <td align="right">$8.95</td>
#      <td><input type="text" id="CherokeeChiefDogwood" size="2" value="0" /></td>
#    </tr>
