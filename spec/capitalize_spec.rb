require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
    before :each do
        @person = Person.new('maximilianus', 22)
    end

    it 'should validate the person name' do
        expect(@person.correct_name).to eq('maximilianus')
    end
    
    it 'should capitalize the name' do
        capitalized_name = CapitalizeDecorator.new(@person)
        expect(capitalized_name.correct_name).to eq('Maximilianus')
    end
end