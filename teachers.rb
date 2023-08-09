require 'json'

class Teachers
  attr_accessor :teachers
  attr_reader :teacher

  def initialize
    @teachers = []
    @teacher = teacher
  end

  def add_teacher(teacher)
    @teachers << teacher
  end

  def grab_teachers
    @teachers
  end

  def teacher_input
    puts 'Creating a teacher'
    puts 'Please enter the teacher\'s name:'
    name = gets.chomp
    puts 'Please enter the teacher\'s age:'
    age = gets.chomp.to_i
    puts 'Please enter the teacher\'s specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, name, age)
    add_teacher(teacher)
    @people = teacher
    puts 'Teacher created successfully!'
  end

  def save_teachers
    teachers_data = @teachers.map do |teacher|
      {
        'specialization' => teacher.specialization,
        'name' => teacher.name,
        'age' => teacher.age
      }
    end

    File.open('teachers.json', 'w') do |file|
      file.write(JSON.generate(teachers_data))
    end
  end

  def load_teachers
    if File.exist?('teachers.json')
      teachers_data = JSON.parse(File.read('teachers.json'))
      teachers_data.each do |teacher_data|
        teacher = Teacher.new(teacher_data['specialization'], teacher_data['name'], teacher_data['age'].to_i)
        add_teacher(teacher)
      end
    end
  end
end
