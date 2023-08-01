require_relative 'person'
require_relative 'student'
require_relative 'teacher'

puts 'Person class'
puts '-----------------'
philip = Person.new('Philip', 15)
puts philip.name
puts philip.age
puts philip.can_use_services?
puts '-----------------'

puts 'Student class'
puts '-----------------'
billy = Student.new('B', 'Billy', 15)
puts billy.name
puts billy.age
puts billy.classroom
puts billy.play_hooky
puts '-----------------'

puts 'Teacher class'
puts '-----------------'
sir_mark = Teacher.new('Math', 'Junior', 45)
puts sir_mark.name
puts sir_mark.age
puts sir_mark.specialization
puts sir_mark.can_use_services?
