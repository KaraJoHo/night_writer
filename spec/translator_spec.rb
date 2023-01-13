require_relative 'spec_helper'

RSpec.describe Translator do 
  let(:translator) {Translator.new}
  let(:dicationary) {Dictionary.new}

  describe '#translator' do 
    it 'exists and has attributes' do 
      expect(translator).to be_a(Translator)
    end
  end
end