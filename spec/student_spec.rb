require_relative '../classroom'
require_relative '../student'

describe Student do
  before :each do
    @classroom = Classroom.new('Class A')
    @student = Student.new(@classroom, 'Clinton Younge', 18)
  end

  it 'should validate student classroom' do
    expect(@student.classroom).to eq(@classroom)
  end

  it 'should validate the student name' do
    expect(@student.name).to eq('Clinton Younge')
  end

  it 'should validate the student age' do
    expect(@student.age).to eq(18)
  end

  it 'should assign a classroom' do
    new_classroom = Classroom.new('Class B')
    @student.assign_classroom(new_classroom)
    expect(@student.classroom).to eq(new_classroom)
    expect(new_classroom.students).to include(@student)
  end

  it 'should play hooky' do
    expect(@student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
