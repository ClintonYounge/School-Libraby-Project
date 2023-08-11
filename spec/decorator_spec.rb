require_relative '../decorator'

describe Decorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'Correct Name') }

  describe '#correct_name' do
    it 'calls the correct_name method on the wrapped nameable' do
      decorator = Decorator.new(nameable)

      expect(decorator.correct_name).to eq('Correct Name')
    end
  end
end
