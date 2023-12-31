require_relative 'person'

class Student < Person
  attr_accessor :classroom
  attr_reader :id

  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true, id: nil)
    super(name, age, parent_permission: parent_permission)
    @id = id || generate_new_id
    @classroom = classroom
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
