class Students
  attr_accessor :students

  def initialize
    @students = []
    @student = student
  end

  def add_student(student)
    @students << student
  end

  def grab_students
    @students
  end

  def student
    @student
  end

  def student_input
    puts 'Please enter the student\'s name:'
    name = gets.chomp

    puts 'Please enter the student\'s age:'
    age = gets.chomp.to_i

    puts 'Does the student have parent permission? (Y/N):'

    parent_permission = gets.chomp.upcase == 'Y'

    classroom = 'Unknown'

    student = Student.new(classroom, name, age, parent_permission: parent_permission)
    add_student(student)
    @student = student
    puts 'Student created successfully!'
  end
end
