require_relative '../classroom'
require_relative '../student'
require_relative '../book'
require_relative '../rental'

describe Rental do
    before :each do
        @classroom = Classroom.new('Class A')
        @student1 = Student.new(@classroom, 'Clinton Younge', 18)
        @student2 = Student.new(@classroom, 'Younge Clinton', 81)
        @book1 = Book.new('The Great Unknown', 'CJ. AY')
        @book2 = Book.new('Unknown The Great', 'AY. CJ')
        Rental.new('2023-08-03', @book1, @student1)
        Rental.new('2023-08-05', @book2, @student2)
    end
    
    it 'rental dates for each book' do
        expect(@book1.rentals[0].date).to eq('2023-08-03')
        expect(@book2.rentals[0].date).to eq('2023-08-05')
    end

    it 'person who rented each book' do
        expect(@book1.rentals[0].person).to eq(@student1)
        expect(@book2.rentals[0].person).to eq(@student2)
    end

    it 'book rented by each person' do
        expect(@student1.rentals[0].book.title).to eq('The Great Unknown')
        expect(@student2.rentals[0].book.title).to eq('Unknown The Great')
    end
end