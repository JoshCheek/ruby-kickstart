module OperatorGeneratorFromSpace
  def <(other)
    (self <=> other) < 0
  end

  def >(other)
    (self <=> other) > 0
  end

  def ==(other)
    (self <=> other) == 0
  end

  def <=(other)
    !(self > other)
  end

  def >=(other)
    !(self < other)
  end
end
