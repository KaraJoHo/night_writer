require_relative 'spec_helper'

RSpec.describe NightWriter do 
  let(:night_writer) {NightWriter.new}

  describe '#initialize' do 
    it 'exists and has a translator' do 
      expect(night_writer).to be_a(NightWriter)
      expect(night_writer.translator).to be_a(Translator)
    end
  end

  describe '#translate_to_braille' do 
    it 'takes a string and translates it to braille' do 
      
      message = 'hey'
      expected = "0.0.00\n00.0.0\n....00"

      expect(night_writer.translate_to_braille(message)).to eq(expected)
    end
  end

end