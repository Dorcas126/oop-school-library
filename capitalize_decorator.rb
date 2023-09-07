require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    person_name = @nameable.correct_name
    person_name.capitalize
  end
end