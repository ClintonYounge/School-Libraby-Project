require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('English', 'Clinton Younge', 30)
  end

  it 'should validate the teacher specialization' do
    expect(@teacher.specialization).to eq('English')
  end

  it 'should validate the teacher name' do
    expect(@teacher.name).to eq('Clinton Younge')
  end

  it 'should validate the teacher age' do
    expect(@teacher.age).to eq(30)
  end

  it 'should validate empty list of rentals' do
    expect(@teacher.rentals).to eq([])
  end

  it 'should allow using services' do
    expect(@teacher.can_use_services?).to eq(true)
  end
end
