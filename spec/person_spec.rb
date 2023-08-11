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
end