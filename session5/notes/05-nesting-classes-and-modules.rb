# You can declare classes and modules inside of each other.
class A
  
  class B
  end
  
  module C
    module D
      class C
        def self.deep_in_the_hole
          "The further down I go, pulls the strings on my violin bow"
        end
      end
    end
  end
  
end

# You can then access them with ::
A                             # => A
A::B                          # => A::B
A::C                          # => A::C
A::C::D                       # => A::C::D
A::C::D::C                    # => A::C::D::C
A::C::D::C.deep_in_the_hole   # => "The further down I go, pulls the strings on my violin bow"
