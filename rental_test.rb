require_relative 'nameable'
require_relative 'person'
require_relative 'book'
require_relative 'rental'

# Test the many-to-many relationship
person1 = Person.new('Clinton Younge', 18)
person2 = Person.new('Younge Clinton', 81)

book1 = Book.new('The Great Unknown', 'CJ. AY')
book2 = Book.new('Unknown The Great', 'AY. CJ')

# Create rentals for the books and people
rental1 = Rental.new('2023-08-03', book1, person1)
rental2 = Rental.new('2023-08-05', book1, person2)
rental3 = Rental.new('2023-08-08', book2, person1)

# Print the rentals associated with a book
puts "#{book1.title} Rentals:"
book1.rentals.each { |rental| puts "- #{rental.date}, Renter: #{rental.person.name}" }

puts "#{book2.title} Rentals:"
book2.rentals.each { |rental| puts "- #{rental.date}, Renter: #{rental.person.name}" }

# Print the rentals associated with a person
puts "#{person1.name} Rentals:"
person1.rentals.each { |rental| puts "- #{rental.date}, Book: #{rental.book.title}" }

puts "#{person2.name} Rentals:"
person2.rentals.each { |rental| puts "- #{rental.date}, Book: #{rental.book.title}" }
