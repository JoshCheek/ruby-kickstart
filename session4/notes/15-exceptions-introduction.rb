# Errors and Exceptions are used to say "something something happend
# that I don't know how to deal with". They halt evaluation, and
# return to where they were called from, incrementally making their
# way up the stack (the series of methods that were called to get to
# wherever the exception was raised) until they are either either
# rescued, or cause the program to crash.

# You raise exceptions with the raise method
raise "This will now die!"
# ~> -:9:in `<main>': This will now die! (RuntimeError)
