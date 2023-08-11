require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new('maximilianus', 22)
  end

  it 'should validate the person name' do
    expect(@person.correct_name).to eq('maximilianus')
  end

  it 'should trim the name' do
    trimmed_person = TrimmerDecorator.new(@person)
    expect(trimmed_person.correct_name).to eq('maximilian')
  end
end
