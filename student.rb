require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    classroom.add_student(self) if classroom

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom.students.delete(self) if @classroom
    @classroom = classroom
    classroom.add_student(self) if classroom
  end
end
