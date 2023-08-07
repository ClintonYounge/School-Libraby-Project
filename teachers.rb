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
end
