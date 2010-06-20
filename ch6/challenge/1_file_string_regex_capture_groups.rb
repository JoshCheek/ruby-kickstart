# One of the courses I took last semester was Information Delivery on the Internet
# For one of the problems, the instructions required creating an HTML table based on 
# a list of different types of trees, their sizes, and their prices
#
# It sounds fairly simple, but there were 14 of these trees, and 4 <td> for
# each one, plus two <tr> for each one. That came out to 84 lines of code
# 
# And what happens if later I realize I made some mistake and have to go change each one of these?
# I have to sift through all this code to make the same change 14 times in a row.
# I realized that this was a perfect opportunity to write a script to do this for me.
#
# The data comes in the following format:
#     "Royal Empress Tree, which ships at 2 to 4 feet, cost: $4.50"
# Where the name is "Royal Empress Tree", the size is "2 to 4 feet", the cost is "$4.50", the id is "RoyalEmpressTree"
# Note that this information was entered by hand by my instructor, occasionally he would forget to put the colon after cost.
# The output format can be seen in the examples below.
#
# (Whitespace formatting should not be important, but the tests will guide you to what they expect.)
#
# YOUR TASK: 
#   create a method that receives a file name, or a string, or an array of Strings. 
#   It must pull from this the tree name, the tree size, and the tree price.
#   It must generate a unique id which is the name with all its spaces removed
#   It must return the html (as a String) that will be placed into the table in the file for the homework assignment
#   Except for the things above, the html will be exactly the same for each tree.
# 
# EXAMPLES:
#   INVOCATION:
#     tableize("American Redbud Tree, which ships at 1 to 2 feet, cost $5.95")
#   RETURNS (as a string):
#     <tr>
#       <td>American Redbud Tree</td>
#       <td>1 to 2 feet</td>
#       <td align="right">$5.95</td>
#       <td><input type="text" id="AmericanRedbudTree" size="2" value="0" /></td>
#     </tr>
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

def tableize
end
