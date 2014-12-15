# You are writing software for the Green Thumb Nursery. They sent you their inventory
# in a text document, but you need to extract the data in order to use it. You start to
# pull it out, by hand, one at a time. But it is tedious and your eyes start drooping.
#
# Suddenly, you realize "Hey, I know Ruby!", and decide to write a simple script to
# take care of this process for you.
#
# The following string will be passed to your method to generate the list of trees with:
#   "American Redbud Tree, which ships at 1 to 2 feet, cost $5.95
#   Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95
#   Black Walnut Tree; which ships at 1 to 2 feet, cost: $4.95
#   Cherokee Chief Dogwood, which ships at 2 to 4 feet, cost: $8.95
#   English Walnut Tree, Which ships at 1 to 2 feet, cost $10.95
#   Flowering Peach Tree, which ships at 2 to 4 feet, cost: $7.95
#   Flowering Pear Tree, which ships at 2 to 4 feet, cost: $8.50
#   Hydrangea Tree, which ships at 1 to 2 feet, cost: $5.95
#   Pecan Tree, which ships at 1 to 2 feet, cost: $5.95
#   Purple Leaf Plum Tree, which ships at 2 to 3 feet, cost: $5.95
#   Royal Empress Tree, which ships @ 2 to 4 feet, cost: $4.50
#   White Dogwood Tree, which ships at 2 to 3 feet, cost: $5.95"
#
# **BE CAREFU!** The Green Thumb Nursery technician had a few fat fingers when entering
# the data, you'll have to make your regex robust enough to accommodate this.
#
# Example:
#   given: "American Redbud Tree, which ships at 1 to 2 feet, cost $5.95")
#   return: [["American Redbud Tree", "1 to 2 feet", "$5.95"]]
#
#   given: "American Redbud Tree, which ships at 1 to 2 feet, cost $5.95
#          Autumn Flowering Cherry, which ships at 2 to 4 feet, cost: $8.95"
#   return: [["American Redbud Tree", "1 to 2 feet", "$5.95"],
#            ["Autumn Flowering Cherry", "2 to 4 feet", "$8.95"]]
#

def tree_parser(trees)
end
