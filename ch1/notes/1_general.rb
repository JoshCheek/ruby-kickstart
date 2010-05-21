# Josh's speaker notes

# =====  Introduction to Ruby  =====
# Origins of the Ruby Language:
# Written By: Mats (Yukihiro Matsumoto)
# First Public Release: 1995
# Ruby is dynamic (interpreted), strongly typed (mostly), dynamically typed (known as duck typing)
# Paradigms:
#   Procedural
#   OO (except for some operators, _everything_ is an object)
#   Functional


# ===== Installation  =====
# get Ruby installed on all their computers (1.9 if possible)
# get their text editor / IDE set up to be able to work with Ruby without necessarily having to go to the command line
# install rspec
# have them download this repo and put it in some directory to work in
# show how to use ri
# show where docs are


# =====  Conventions  =====
# show how the comment hash rocket works
# explain that if their text editor doesn't do this, they can use p
# show how to run from the command line if they wish to
#   there will be no class file, no object file, MRI is not compiled to bytecode, it just interprets the file
# show that challenges are in chx/challenge/y
# show how to run rake tasks to test that challenge


# =====  Objects and Methods  =====
# ruby is a purely Object Oriented programming language.
# there are no primitives
# everything is an object: Classes are objects, methods are objects, operators are objects, integers are objects
# all instances of a class do not necessarily share the same methods, because Ruby is dynamic.
# you can add and remove methods at run time to both classes as well as individual objects


# =====  A Sample Ruby Application  =====
# Show first example
# 
# you can name your files whatever you want, unlike Java, it does not need to be named after a class
#
# you do not need to use classes if you do not wish to (procedural paradigm)
#
# show that puts is a method (some things feel like functions, but they are really methods)
# show that parens are optional , 
#   semicolons are optoinal
#   it converts whatever method it receives to a String
#   show #to_s
#   puts will output to $stdout
#
# variables do not need to be declared
# creates a local variable called answer, and sets it equal to the Integer 4
#
# string Interpolation


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
# mostly obvious, but if your text editor highlights it, then don't use it.


# =====  Assignment Compatibility  =====
# You _CAN_ store an object of one type in a variable of another type, because Ruby is dynamically typed
# Ask them to come up with an example on their own to show this
# then show example 2


# =====  Logic  =====
# false = { false , nil }
# true  = everything else
# if ; elsif ; else ; end
# expression if condition
# ask them how to do challenge 2


# =====  Arithematic Operators  =====
# behave the same as normal
# have them complete challenge 1..4


# =====  Strings  =====
# regular operators work with Strings, don't need complicated methods
# **STRINGS ARE MUTABLE**
# ask how to test if two strings are the same
# give cheetsheat
# show example 3


# =====  First Homework Assginment  =====
# Complete all challenges for ch1