require_relative '../classroom'
require_relative '../student'

describe Student do
  before :each do
    @classroom = Classroom.new('Class A')
    @student = Student.new(@classroom, 'Clinton Younge', 18)
  end

  it 'validate student classroom' do
    expect(@student.classroom).to eq(@classroom)
  end

  it 'validate the student name' do
    expect(@student.name).to eq('Clinton Younge')
  end

  it 'validate the student age' do
    expect(@student.age).to eq(18)
  end

  it 'validate empty list of rentals' do
    expect(@student.rentals).to eq([])
  end
end
