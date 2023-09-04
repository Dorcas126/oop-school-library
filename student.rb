require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(_id, age, classroom, parent_permission: true, name: 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
