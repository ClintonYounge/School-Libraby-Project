require_relative '../person'

describe Person do
  before :each do
    @person = Person.new('Alice', 15)
  end

  it 'should have a name' do
    expect(@person.name).to eq('Alice')
  end

  it 'should have an age' do
    expect(@person.age).to eq(15)
  end

  describe '#generate_new_id' do
    it 'should generate a new ID' do
      expect(@person.generate_new_id).to be_an(Integer)
    end
  end

  describe '#add_rental' do
    it 'should add a rental to rentals' do
      rental = double('rental')
      @person.add_rental(rental)
      expect(@person.rentals).to include(rental)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(@person.correct_name).to eq('Alice')
    end
  end

  describe '#can_use_services?' do
    it 'should return true if age is 18 or above' do
      @person.age = 18
      expect(@person.can_use_services?).to eq(true)
    end

    it 'should return true if parent permission is granted' do
      @person.parent_permission = true
      expect(@person.can_use_services?).to eq(true)
    end

    it 'should return false if age is below 18 and parent permission is not granted' do
      @person.age = 17
      @person.parent_permission = false
      expect(@person.can_use_services?).to eq(false)
    end
  end
end
