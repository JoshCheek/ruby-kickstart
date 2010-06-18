# =====  Reflection and Introspection (they're synonyms)  =====
# it can be useful to know about what kind of an object you are dealing with
# what your environment is like, etc
# here are some useful methods for this purpose
#
# Got this list from http://weare.buildingsky.net/2009/08/25/rubys-metaprogramming-toolbox
# the pound between the class and the method indicates that it is an instance method
#   Object#inspect
#   Object#object_id
#   Object#class
#   Object#instance_variables
#   Object#methods
#   Object#private_methods
#   Object#public_methods
#   Object#singleton_methods
#   Module#class_variables
#   Module#constants
#   Module#included_modules
#   Module#instance_methods
#   Module#name
#   Module#private_instance_methods
#   Module#protected_instance_methods
#   Module#public_instance_methods
#


# examples
require 'date'  # pulls in date class from the stdlib
class Person
  # class level
  IS_HUMAN = true
  
  class << self
    def human?() IS_HUMAN end
  end
  
  # instance level
  attr_accessor :birthday
  def initialize(name,age,birthday)
    @name , @age , @birthday = name , age , birthday
  end
  
end
audrey = Person.new 'Audrey' , 28 , Date.parse('1 Jan 1995')

# what class is the object?
1.class                             # => Fixnum
1.0.class                           # => Float
"abc".class                         # => String
audrey.class                        # => Person
audrey.birthday.class               # => Date

# are two objects the same?
# symbols are
:abc.object_id                      # => 215868
:abc.object_id                      # => 215868
# strings are not
"abc".object_id                     # => 2148310280
"abc".object_id                     # => 2148308540
# classes are
Array.object_id                     # => 2148370060
Array.object_id                     # => 2148370060
# Two separate instantiations of non singleton (patterned) classes aren't
Array.new.object_id                 # => 2148303280
Array.new.object_id                 # => 2148301520

# what instance variables does the object have?
@hello , @world = %w(hello world)
self.instance_variables             # => ["@hello", "@world"]
audrey.instance_variables           # => ["@birthday", "@age", "@name"]
audrey.birthday.instance_variables  # => ["@sg", "@of", "@ajd"]

# what methods does the object have?
audrey.methods                      # => ["inspect", "tap", "birthday=", "clone", "public_methods", "object_id", "__send__", "instance_variable_defined?", "equal?", "freeze", "extend", "send", "methods", "hash", "dup", "to_enum", "instance_variables", "eql?", "instance_eval", "id", "singleton_methods", "taint", "frozen?", "instance_variable_get", "enum_for", "instance_of?", "display", "to_a", "method", "type", "instance_exec", "protected_methods", "==", "===", "instance_variable_set", "kind_of?", "respond_to?", "to_s", "class", "__id__", "tainted?", "=~", "private_methods", "untaint", "nil?", "is_a?", "birthday"]
audrey.methods.grep(/birthday/)     # => ["birthday=", "birthday"]
1.methods.sort                      # => ["%", "&", "*", "**", "+", "+@", "-", "-@", "/", "<", "<<", "<=", "<=>", "==", "===", "=~", ">", ">=", ">>", "[]", "^", "__id__", "__send__", "abs", "between?", "ceil", "chr", "class", "clone", "coerce", "denominator", "display", "div", "divmod", "downto", "dup", "enum_for", "eql?", "equal?", "even?", "extend", "fdiv", "floor", "freeze", "frozen?", "gcd", "gcdlcm", "hash", "id", "id2name", "inspect", "instance_eval", "instance_exec", "instance_of?", "instance_variable_defined?", "instance_variable_get", "instance_variable_set", "instance_variables", "integer?", "is_a?", "kind_of?", "lcm", "method", "methods", "modulo", "next", "nil?", "nonzero?", "numerator", "object_id", "odd?", "ord", "power!", "prec", "prec_f", "prec_i", "pred", "private_methods", "protected_methods", "public_methods", "quo", "rdiv", "remainder", "respond_to?", "round", "rpower", "send", "singleton_method_added", "singleton_methods", "size", "step", "succ", "taint", "tainted?", "tap", "times", "to_a", "to_enum", "to_f", "to_i", "to_int", "to_r", "to_s", "to_sym", "truncate", "type", "untaint", "upto", "zero?", "|", "~"]
"abc".methods                       # => ["upcase!", "zip", "find_index", "between?", "unpack", "enum_slice", "to_f", "minmax", "lines", "sub", "methods", "send", "replace", "empty?", "group_by", "squeeze", "crypt", "gsub!", "taint", "instance_variable_defined?", "match", "downcase!", "take", "find_all", "min_by", "bytes", "each_cons", "entries", "gsub", "singleton_methods", "instance_eval", "to_str", "first", "chop!", "intern", "nil?", "succ", "capitalize!", "take_while", "select", "max_by", "chars", "enum_cons", "tr!", "protected_methods", "instance_exec", "display", "sort", "chop", "tainted?", "dump", "method", "include?", "untaint", "instance_of?", "chomp!", "swapcase!", "drop", "equal?", "reject", "hex", "minmax_by", "sum", "hash", "private_methods", "all?", "tr_s!", "sort_by", "chomp", "upcase", "start_with?", "succ!", "kind_of?", "strip!", "freeze", "drop_while", "eql?", "next", "collect", "oct", "id", "slice", "casecmp", "grep", "strip", "any?", "delete!", "public_methods", "end_with?", "downcase", "%", "object_id", "is_a?", "scan", "lstrip!", "cycle", "map", "member?", "tap", "type", "*", "split", "insert", "each_with_index", "+", "count", "lstrip", "one?", "squeeze!", "instance_variables", "__id__", "frozen?", "capitalize", "next!", "each_line", "to_enum", "rstrip!", "to_a", "ljust", "respond_to?", "upto", "each", "inject", "tr", "slice!", "class", "reverse", "length", "enum_with_index", "rpartition", "rstrip", "<=>", "none?", "instance_variable_get", "find", "==", "swapcase", "__send__", "===", "min", "each_byte", "enum_for", "extend", "to_s", "rjust", "index", ">=", "size", "reduce", "tr_s", "<=", "clone", "reverse_each", "to_sym", "bytesize", "=~", "instance_variable_set", "<", "detect", "max", "each_char", "each_slice", ">", "to_i", "center", "inspect", "[]", "reverse!", "rindex", "partition", "delete", "[]=", "concat", "sub!", "dup", "<<"]

"abc".private_methods               # => ["untrace_var", "load", "readlines", "sprintf", "exit", "syscall", "remove_instance_variable", "eval", "set_trace_func", "require", "p", "exit!", "initialize", "format", "abort", "open", "autoload", "login_name", "at_exit", "printf", "iterator?", "Integer", "fork", "`", "initialize_copy", "srand", "catch", "print", "block_given?", "binding", "autoload?", "Float", "loop", "callcc", "exec", "method_missing", "Rational", "rand", "throw", "putc", "proc", "String", "system", "global_variables", "puts", "lambda", "singleton_method_added", "raise", "test", "Array", "sleep", "local_variables", "warn", "gets", "trap", "singleton_method_removed", "fail", "trace_var", "__method__", "readline", "singleton_method_undefined", "caller", "getc"]
[1,2,3].private_methods             # => ["chomp!", "exit!", "fail", "print", "initialize", "binding", "Array", "split", "catch", "iterator?", "chop", "format", "readlines", "trap", "remove_instance_variable", "getc", "caller", "singleton_method_added", "putc", "proc", "autoload?", "p", "throw", "block_given?", "chomp", "sub!", "syscall", "trace_var", "loop", "callcc", "Integer", "exec", "load", "exit", "singleton_method_removed", "puts", "login_name", "initialize_copy", "srand", "lambda", "global_variables", "gsub!", "`", "open", "untrace_var", "system", "method_missing", "Float", "require", "abort", "sub", "singleton_method_undefined", "gets", "test", "rand", "eval", "warn", "local_variables", "chop!", "fork", "printf", "set_trace_func", "raise", "scan", "Rational", "String", "sleep", "gsub", "sprintf", "readline", "autoload", "at_exit", "__method__"]
audrey.private_methods              # => ["exit!", "chomp!", "initialize", "print", "fail", "binding", "split", "Array", "readlines", "format", "chop", "iterator?", "catch", "trap", "getc", "remove_instance_variable", "putc", "singleton_method_added", "caller", "autoload?", "proc", "chomp", "block_given?", "throw", "p", "sub!", "loop", "trace_var", "syscall", "exec", "Integer", "callcc", "login_name", "initialize_copy", "puts", "singleton_method_removed", "exit", "load", "lambda", "srand", "global_variables", "gsub!", "untrace_var", "open", "`", "Float", "method_missing", "system", "gets", "singleton_method_undefined", "sub", "abort", "require", "rand", "test", "warn", "eval", "local_variables", "chop!", "scan", "Rational", "raise", "set_trace_func", "printf", "fork", "sleep", "select", "String", "gsub", "sprintf", "readline", "at_exit", "autoload", "__method__"]

12.methods == 12.public_methods     # => true

Person.constants                    # => ["IS_HUMAN"]
Person.singleton_methods            # => ["human?"]