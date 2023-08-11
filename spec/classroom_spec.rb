require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Class A')
  end

  it 'should have a label' do
    expect(@classroom.label).to eq('Class A')
  end

  it 'should have no students' do
    expect(@classroom.students).to be_empty
  end

  it 'should add a student' do
    student = Student.new(@classroom, 'Alice', 15)
    @classroom.add_student(student)
    expect(@classroom.students).to include(student)
  end
end
