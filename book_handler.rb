class BookHandler
  attr_accessor :library_book, :new_book

  def initialize
    @new_book
  end

  def library_book
    @new_book
  end
  
  def create_book
    puts 'Creating a book'

    puts 'Please enter the book title:'
    title = gets.chomp

    puts 'Please enter the book author:'
    author = gets.chomp

    new_book = Book.new(title, author)
    @new_book = new_book

    puts 'Book created successfully!'
  end

  def list_all_books(library)
    puts 'Listing all books'
    puts '--------------------------------'

    books = library.grab_all_books

    if books.empty?
      puts 'There are no books in the library'
    else
      books.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}"
        puts '--------------------------------'
      end
    end
  end
end
