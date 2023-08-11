require_relative '../book'
require_relative '../rental'
require_relative '../student'
require_relative '../classroom'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
    @classroom = Classroom.new('Classroom')
    @student = Student.new(@classroom, 'Clinton Younge', 18)
  end

  it 'should have a title' do
    expect(@book.title).to eq('Title')
  end

  it 'should have an author' do
    expect(@book.author).to eq('Author')
  end

  it 'should have an empty list of rentals' do
    expect(@book.rentals).to eq([])
  end

  it 'should add a rental' do
    rental = Rental.new('2022-10-10', @book, @student)
    @book.add_rental(rental)
    expect(@book.rentals[0]).to eq(rental)
  end
end
