require_relative 'person'

class Student < Person
  attr_accessor :classroom
  attr_reader :id

  def initialize(classroom, name = 'Unknown', age = nil, parent_permission: true, id: nil)
    super(name, age, parent_permission: parent_permission)
    @id = id || (Person.load_last_id + 1)
    @classroom = classroom
    Person.update_last_id(@id)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
