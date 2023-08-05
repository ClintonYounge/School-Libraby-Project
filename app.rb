require_relative 'library'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'students'
require_relative 'teachers'
require_relative 'rental'

class App
  attr_accessor :library, :students, :teachers

  def initialize
    @library = Library.new
    @students = Students.new
    @teachers = Teachers.new
    @people = []
    @rentals = []
  end

  def welcome
    display_welcome_message
  end

  def run
    display_options
    handle_user_choice
  end

  private

  def list_all_books
    puts 'Listing all books'
    puts '--------------------------------'

    books = @library.grab_all_books

    if books.empty?
      puts 'There are no books in the library'
    else
      books.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}"
        puts '--------------------------------'
      end
    end
    run
  end

  def list_all_people
    students = @students.grab_students
    teachers = @teachers.grab_teachers

    if students.empty?
      puts 'There is no student in the library'
    else
      puts ' '
      students.each do |student|
        puts "[Student] Name: #{student.name}, Age: #{student.age}, Parental Perms: #{student.parent_permission}"
      end
    end

    if teachers.empty?
      puts 'There is no teacher in the library'
    else
      puts ' '
      teachers.each do |teacher|
        puts "Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
      end
    end
    run
  end

  def person_type_one
    puts 'Please enter the student\'s name:'
    name = gets.chomp

    puts 'Please enter the student\'s age:'
    age = gets.chomp.to_i

    puts 'Does the student have parent permission? (Y/N):'

    parent_permission = gets.chomp.upcase == 'Y'

    classroom = 'Unknown'

    student = Student.new(classroom, name, age, parent_permission: parent_permission)
    @students.add_student(student)
    @people.push(student)
    puts 'Student created successfully!'
  end

  def person_type_two
    puts 'Creating a teacher'
    puts 'Please enter the teacher\'s name:'
    name = gets.chomp
    puts 'Please enter the teacher\'s age:'
    age = gets.chomp.to_i
    puts 'Please enter the teacher\'s specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    @teachers.add_teacher(teacher)
    @people.push(teacher)
    puts 'Teacher created successfully!'
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'

    person_type = gets.chomp.to_i

    if person_type == 1
      person_type_one
    elsif person_type == 2
      person_type_two
    else
      puts 'Invalid option'
    end
    run
  end

  def create_book
    puts 'Creating a book'

    puts 'Please enter the book title:'
    title = gets.chomp

    puts 'Please enter the book author:'
    author = gets.chomp

    new_book = Book.new(title, author)
    @library.add_book(new_book)

    puts 'Book created successfully!'
    run
  end

  def create_rental
    puts 'Rental created successfully!'
    run
  end

  def list_rentals_for_person
    puts 'Listing all rentals for a given person id'
    run
  end

  def exit
    puts 'Exiting'
  end
end
