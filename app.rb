require_relative 'library'
require_relative 'student'
require_relative 'teacher'
require_relative 'students'
require_relative 'teachers'
require_relative 'book'
require_relative 'rental'
require_relative 'menu_handler'
require_relative 'book_handler'
require_relative 'people_handler'

class App
  attr_accessor :library, :students, :teachers, :something, :bookhandler

  def initialize
    @library = Library.new
    @students = Students.new
    @teachers = Teachers.new
    @bookhandler = BookHandler.new
    @people_handler = PeopleHandler.new
    @people = []
    @rentals = []
  end

  def welcome
    puts 'Welcome to the School\'s Library'
    puts '--------------------------------'
  end

  def run
    menu_handler = MenuHandler.new(self)
    menu_handler.display_options
    menu_handler.handle_user_choice
  end

  def list_all_people
    @people_handler.list_all_people(@students, @teachers)   
    run
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'

    person_type = gets.chomp.to_i

    if person_type == 1
      @students.student_input
      @people.push(@students.student)
    elsif person_type == 2
      @teachers.teacher_input
      @people.push(@teachers.teacher)
    else
      puts 'Invalid option'
    end
    run
  end

  def create_book
    @bookhandler.create_book
    new_book = @bookhandler.library_book
    @library.add_book(new_book)
    run
  end

  def list_all_books
    @bookhandler.list_all_books(@library)
    run
  end

  def grab_book_num
    books = @library.grab_all_books

    if books.empty?
      puts 'There are no books in the library, press any key to continue.'
    else
      puts "Choose a book by number (from 0 to #{books.size - 1}):"
      books.each_with_index do |book, index|
        puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
      end
    end
    gets.chomp.to_i
  end

  def grab_person_num
    if @people.empty?
      puts 'There is no one in the library.'
    else
      puts ' '
      puts 'Select a person from the following list by number (not id):'

      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    gets.chomp.to_i
  end

  def create_rental
    book_num = grab_book_num
    person_num = grab_person_num

    puts 'Please enter the date in YYYY-MM-DD format:'
    date = gets.chomp

    @rentals.push(Rental.new(date, @library.grab_all_books[book_num], @people[person_num]))
    puts 'Rental created successfully!'
    run
  end

  def list_rentals_for_person
    puts 'Listing all rentals for a given person id'
    puts 'Please enter the person id:'
    person_id = gets.chomp.to_i
    puts ' '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}" if rental.person.id == person_id
    end
    run
  end

  def exit
    puts 'Thank you for using this app!'
  end
end
