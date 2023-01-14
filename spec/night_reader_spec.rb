require_relative 'spec_helper' 

RSpec.describe NightReader do 
  let(:night_reader) {NightReader.new}
  let(:translator) {Translator.new}

  describe '#initialize' do 
    it 'exists and has a translator' do 
      expect(night_reader).to be_a(NightReader)
      expect(night_reader.translator).to be_a(Translator)
    end
  end
end