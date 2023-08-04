require_relative 'library'
require_relative 'book'

class App
  attr_accessor :library

  def initialize
    @library = Library.new
  end

  def welcome
    display_welcome_message
  end

  def run
    display_options
    handle_user_choice
  end

  private

  def display_welcome_message
    puts 'Welcome to the School\'s Library'
    puts '--------------------------------'
  end

  def display_options
    puts ' '
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '--------------------------------'
  end

  def handle_user_choice
    option = gets.chomp.to_i

    menu_options = {
      1 => :list_all_books,
      2 => :list_all_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :exit
    }

    if menu_options.key?(option)
      send(menu_options[option])
    else
      puts 'Invalid option'
    end
  end

  def list_all_books
    puts 'Listing all books'
    puts '--------------------------------'

    books = @library.grab_all_books

    if books.empty?
      puts 'There are no books in the library'
    else
      books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
        puts '--------------------------------'
      end
    end
    run
  end

  def list_all_people
    puts 'Listing all people'
  end

  def create_person
    puts 'Creating a person'
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
    puts 'Creating a rental'
  end

  def list_rentals_for_person
    puts 'Listing all rentals for a given person id'
  end

  def exit
    puts 'Exiting'
  end
end

def main
  app = App.new
  app.welcome
  app.run
end

main
