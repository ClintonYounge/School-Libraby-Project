require 'json'

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

  attr_reader :student

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

  def save_students
    students_data = @students.map do |student|
      {
        'classroom' => student.classroom,
        'name' => student.name,
        'age' => student.age,
        'id' => 
        'parent_permission' => student.parent_permission
      }
    end

    File.write('students.json', JSON.generate(students_data))
  end

  def load_students
    return unless File.exist?('students.json')

    students_data = JSON.parse(File.read('students.json'))
    students_data.each do |student_data|
      student = Student.new(
        student_data['classroom'],
        student_data['name'],
        student_data['age'].to_i,
        parent_permission: student_data['parent_permission']
        
      )
      add_student(student)
    end
  end
end
