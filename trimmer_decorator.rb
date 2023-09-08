require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    person_name = @nameable.correct_name
    person_name.length > 10 ? person_name[0..9] : person_names
  end
end
