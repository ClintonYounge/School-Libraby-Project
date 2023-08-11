require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('English', 'Clinton Younge', 18)
  end

  it 'validate the teacher specialization' do
    expect(@teacher.specialization).to eq('English')
  end

  it 'validate the teacher name' do
    expect(@teacher.name).to eq('Clinton Younge')
  end

  it 'validate the teacher age' do
    expect(@teacher.age).to eq(18)
  end

  it 'validate empty list of rentals' do
    expect(@teacher.rentals).to eq([])
  end
end
