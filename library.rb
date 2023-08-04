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
end
