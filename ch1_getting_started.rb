# =====  Introduction to Ruby  =====
# Origins of the Ruby Language:
# Written By: Mats (Yukihiro Matsumoto)
# First Public Release: 1995
# Ruby is dynamic (interpreted), strongly typed (mostly), dynamically typed (known as duck typing)
# Ruby is written in C (Matz's Ruby Interpreter), but there are implementations written in Java (Jruby), presumably C# (IronRuby), Objective-C (MacRuby), C++ (Rubinius)
# Paradigms:
#   Procedural
#   OO (except for some operators, _everything_ is an object)
#   Functional


# =====  Objects and Methods  =====
# Ruby is a purely Object Oriented programming language.
# There are no primitives
# Everything is an object: Classes are objects, methods are objects, operators are objects, integers are objects
# Some examples:
1.class           # => Fixnum
1.class.ancestors # => [Fixnum, Integer, Precision, Numeric, Comparable, Object, Kernel]
self.class        # => Object
Array.class       # => Class
Array.ancestors   # => [Array, Enumerable, Object, Kernel]
meth = 1.method('<<') 
meth              # => #<Method: Fixnum#<<>
meth.class        # => Method
Method.ancestors  # => [Method, Object, Kernel]

# All instances of a class do not necessarily share the same methods, because Ruby is dynamic.
# You can add and remove methods at run time. You can add and remove methods for individual objects as well as classes



# =====  A Sample Ruby Application  =====
# A sample Ruby Application, see ch1/1_first_program.rb
#
# You can name your files whatever you want, unlike Java, it does not need to be named after a class
#
# You do not need to define classes in your files if you do not wish to (procedural paradigm)
#
# "puts" is the method (you can think of it as a function if you like) that will convert it's parameters to a String, and print them out (it prints to standard output)
#
# Things in quotes are Strings
# So: puts "Hello reader." 
# is the same as $stdout.puts("Hello reader.");
# However, the $stdout is implicit, and semicolons are optional, and parentheses around parameters are optional as long as there is no ambiguity
#
# Variables do not need to be declared, so: answer = 2 + 2
# creates a local variable called answer, and sets it equal to the Integer 4
#
# You can embed variables in Strings with "#{...}" Whatever the "..." evaluates to (in this case, 4) it will be converted to a String and interpolated



# =====  Byte-Code and Virtual Machines  =====
# Byte-code and virtual machines depend on the implementaiton. Obviously JRuby runs on the Java Virtual Machine
# MRI (Matz's Ruby Interpreter, what you are using) does not compile to ByteCode
# The only Ruby that I am sure has Byte-Code is Rubinius, that's sort of it's raison d'etre



# =====  Running A Ruby Program  =====
# Invoke with: $ ruby ch1/1_first_program.rb
# A good text editor can execute the program from within it
# There will be no class file, no object file, MRI is not compiled to bytecode, it just interprets the file



# =====  Expressions And Assignment Statements  =====
# Variables are references to objects, they basically behave exactly like Java's
# Set a variable like this: my_var = 123
# The variable does not have a type, the type is based on the object it is referencing, this is dynamic typing
# As long as an object is referenced by a variable, the garbage collector will not take it
# You cannot reference a variable, only the object it is pointing to (no double pointers like in C)



# =====  Identifiers and Variables  =====
# Refer to the current object with "self" instead of "this"
# Standard naming rules apply (ie don't begin a var name with a number)
# INSTANCE VARIABLES
#   Variables that begin with @ are instance variables (in Java, to directly access a variable, you might say this.myVar, 
#     in Ruby you would say @my_var. Notice Ruby uses snake_case instead of CamelCase. Ruby's self.my_var would be a method call, remember parentheses are optional)
# STATIC / CLASS VARIABLES 
#   Variables that begin with @@ are class variables (In Java you would call them static variables ie MyClass.myVar translates to @@my_var
#   All instance and static variables are private and outside of the class, can only be accessed through methods. There is no MyClass.@@my_var 
# GLOBAL VARIABLES
#   Variables that begin with $ are global (there are a few nuanced exceptions) You are strongly discouraged from using these
# CONSTANTS
#   Constants begin with capital letters. Unlike Java, you can still change them (but the interpreter will give you a warning, unless you explicitly use methods designed for that purpose)
#   Their scope should cascade down such that anything defined in a scope nested in the defined scope, will be able to access them. ie
    MyConstant  = 12
    my_variable = 13
    class Example
      begin
        MyConstant        # => 12
        my_variable 
      rescue => exception
        exception         # => #<NameError: undefined local variable or method `my_variable' for Example:Class>
      end
    end
# LOCAL VARIABLES
# All variables that don't begin with @, @@, and $, are local variables, they will go away as soon as you leave scope



# =====  Keywords  ====
# If your text editor highlights it, then don't use it.



# =====  Examples of Assignment Statements  =====
# same obvious assignments as before. Basically, if you can do my_var = my_var OPERATOR value, you can replace it with my_var OPERATOR= value
count = 2   # => 2
count += 2  # => 4
count <<= 2 # => 16
count *= 2  # => 32
count /= 2  # => 16
count %= 5  # => 1



# =====  Assignment Compatibility  =====
# You _CAN_ store an object of one type in a variable of another type, because Ruby is dynamically typed
# Example:
count           # => 1
count = "abc"
count           # => "abc"
count = /def/   # => /def/
# Don't do this superfluously, it can make sense in some cases (ie normalize a parameter by converting to a String), but otherwise is bad practice
#
# Java and C are weakly typed, meaning they will convert objects if they are compatible.
# Example: byte -> short -> int -> long -> float -> double
# Ruby is strongly typed, the interpreter does not convert types for you, the code must explicitly do this.
# "abc" + 1  in Java returns "abc1"
# "abc" + 1  in Ruby raises #<TypeError: can't convert Fixnum into String>
# There are a few exceptions (ie Boolean operators), and the definitions get a little hazy in places


# 