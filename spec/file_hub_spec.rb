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

  describe '#read_message' do 
    it 'reads the message and translates english to braille' do 
      message = double("Hey")
      allow(file_hub.read_message).to receive(:message).and_return("0.0.00\n00.0.0\n....00")
      expect(file_hub.read_message).to eq("0.0.00\n00.0.0\n....00")
    end
  end
end