require_relative 'classroom'
require_relative 'student'

classroom_a = Classroom.new('Class A')
classroom_b = Classroom.new('Class B')

student1 = Student.new(classroom_a, 'Alice', 15)
student2 = Student.new(classroom_a, 'Bob', 16)
student3 = Student.new(classroom_b, 'Carol', 15)

# Adding students to the classrooms
classroom_a.add_student(student1)
classroom_a.add_student(student2)
classroom_b.add_student(student3)

puts "#{classroom_a.label} students: #{classroom_a.students.map(&:name).join(', ')}"
puts "#{classroom_b.label} students: #{classroom_b.students.map(&:name).join(', ')}"
