require_relative '../nameable'

describe Nameable do
    before :each do
        @nameable = Nameable.new
    end

  describe '#correct_name' do
    it 'raises NotImplementedError' do     
      expect {@nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end