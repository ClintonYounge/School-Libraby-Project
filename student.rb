require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name = 'Unknown', age = nil, parent_permission: true, classroom:)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

billy = Student.new('Billy', 15, classroom: 'B')
puts billy.name
puts billy.age
puts billy.classroom
puts billy.play_hooky
