# Modules are just like classes in that they contain methods. But
# unlike classes, you can't instantiate them. Instead, we include
# their methods in some other class, and then its instances get
# the module's methods.

# A class can only inherit from one other class, but it can include
# as many modules as it likes (this is commonly called a mix-in)

# Because of this (among other things), mixing modules in is usually
# preferred in the Ruby community, rather than subclassing.
# Now, people usually prefer to get functionality by mixing in a
# module rather than subclassing another class.

