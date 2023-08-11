require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  it 'should have a title' do
    expect(@book.title).to eq('Title')
  end

  it 'should have an author' do
    expect(@book.author).to eq('Author')
  end
end
