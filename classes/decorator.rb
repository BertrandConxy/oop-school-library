class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class BaseDecorator < Nameable
  attr_reader :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    str = @nameable.correct_name
    str.size <= 10 ? str : str[0...10]
  end
end
