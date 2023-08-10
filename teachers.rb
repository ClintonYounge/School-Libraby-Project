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
    @teacher = teacher
    puts 'Teacher created successfully!'
  end

  def save_teachers
    teachers_data = @teachers.map do |teacher|
      {
        'specialization' => teacher.specialization,
        'name' => teacher.name,
        'age' => teacher.age,
        'id' => teacher.id
      }
    end

    File.write('teachers.json', JSON.generate(teachers_data))
  end

  def load_teachers
    return unless File.exist?('teachers.json')

    teachers_data = JSON.parse(File.read('teachers.json'))
    teachers_data.each do |teacher_data|
      teacher = Teacher.new(
        teacher_data['specialization'],
        teacher_data['name'],
        teacher_data['age'].to_i,
        id: teacher_data['id']
      )
      add_teacher(teacher)
    end
  end
end
