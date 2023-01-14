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

  describe '#translate_to_english' do 
    it 'takes a string and translates it to braille' do 
    
      braille = "0.0.00\n00.0.0\n....00"
      expected = 'hey'
      
      expect(night_reader.translate_to_english(braille)).to eq(expected)
    end
  end
end