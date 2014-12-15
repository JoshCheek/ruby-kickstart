# A great use for modules is as namespaces: You can do all sorts
# of stuff in a module, and it keeps it contained within that
# module. This prevents conflicts with similarly named things
# in other places.

# Example:
# Maybe you want to try the same problem several days in a row,
# to see how your approach changes over time.
module Day1Solutions
  class MinFinder
    def initialize(a, b)
      @a = a
      @b = b
    end
    def solve
      if @a < @b then @a else @b end
    end
  end
end

module Day2Solutions
  class MinFinder
    def initialize(a, b)
      @elements = [a, b]
    end
    def solve
      @elements.min
    end
  end
end

day1 = Day1Solutions::MinFinder.new 10, 5
day2 = Day2Solutions::MinFinder.new 10, 5
day1          # => #<Day1Solutions::MinFinder:0x000001008679b8 @a=10, @b=5>
day2          # => #<Day2Solutions::MinFinder:0x00000100867990 @elements=[10, 5]>
day1.solve    # => 5
day2.solve    # => 5

