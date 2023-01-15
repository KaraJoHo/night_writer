require_relative 'spec_helper'

RSpec.describe FileHub do 
  let(:file_hub) {FileHub.new}

  describe '#initialize' do 
    it 'exists and has a night reader, night writer and translated message attributes' do 
      expect(file_hub).to be_a(FileHub)
      expect(file_hub.night_writer).to be_a(NightWriter)
      expect(file_hub.night_reader).to be_a(NightReader)
      expect(file_hub.translated_to_braille).to eq("")
      expect(file_hub.translated_to_english).to eq("")
    end
  end
end