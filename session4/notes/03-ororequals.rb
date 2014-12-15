# A common idiom is to use the conditional or values to only set
# a variable if it hasn't been set yet. Remember that `a += b`
# expands to `a = a + b`, well `a ||= b` expands to `a = (a || b)`
# When it has been set, it returns the value of a. When it hasn't
# been set, it is nil, so returns the value of b.


# Here is an example, I am using this in ruby-kickstart.com
# (http://goo.gl/21tEg) I have regular expressions that match
# against your answers, but databases don't know what regular
# expressions are, so I have to convert them into a text format
# called YAML. Then when I want to use them, I convert them out
# of YAML back into a regular expression.
#
# In order to not incure the cost of converting from YAML
# every time I want to use the regex, I only do it the first
# time by using ||=
class QuizRegex < ActiveRecord::Base
  belongs_to :quiz_match_answer_problem

  def regex=(regex)
    @regex = regex
    self.content = YAML.dump regex
  end

  def regex
    @regex ||= YAML.load(content)
  end
end
