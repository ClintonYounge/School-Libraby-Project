require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    self.assign_classroom(classroom)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
