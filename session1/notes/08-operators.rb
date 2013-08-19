=begin rdoc

<b>There are some special methods called operators.
They are special because the Ruby interpreter lets you use them in pretty ways, even though they are just methods.
That's called syntactic sugar!</b>

<b>There is a method named +</b>
 3.+( 5 )        # => 8

<b>You are actually sending 3 to that method with an arument of 5.</b>
 3.send :+, 5

<b>But that's ugly, *ick*, Ruby is beautiful, so it lets you say</b>
 3 + 5         # => 8
 2 - 4         # => -2
 10 / 3        # => 3
 10 % 3        # => 1

<b>See, it knows what to do :)
( % tells you the remainder )</b>

<b>Ruby wants to help you, but syntactic sugar wouldn't be much help if it changed the semantics of math, so Ruby respects order of operations.</b>
 2 * 3 + 10   # => 16
 2 + 3 * 10   # => 32

<b>Question: if operators are just methods on objects, can other objects have operators?
Lets open up irb and try it out!</b>

=end