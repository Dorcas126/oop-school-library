require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id,name:'Unknown', age, parent_permission:true, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\\(ツ)/¯"
  end
end
