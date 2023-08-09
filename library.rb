class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def grab_all_books
    @books
  end

  def load_books
    if File.exist?('books.json')
      books_data = JSON.parse(File.read('books.json'))
      books_data.each do |book_data|
        add_book(Book.new(book_data['title'], book_data['author']))
      end
    end
  end

  def save_books
    books_data = @books.map do |book|
      {
        'title' => book.title,
        'author' => book.author
      }
    end

    File.open('books.json', 'w') do |file|
      file.write(JSON.generate(books_data))
    end
  end
end
