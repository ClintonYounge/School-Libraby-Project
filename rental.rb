require_relative 'book'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book

    if person.is_a?(Student) || person.is_a?(Teacher)
      @person = person
      book.add_rental(self)
      person.add_rental(self)
    else
      raise ArgumentError, "Invalid person type for rental"
    end
  end
end

