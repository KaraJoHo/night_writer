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
      message = 'a_message.txt'
      content = 'Hey'
      allow(File).to receive(:open).with(message, 'r').and_yield(StringIO.new(content))
      expect(StringIO.new(content).read).to eq(content)

      result = ""
      File.open('a_message.txt', 'r') {|f| result = f.read}
      expect(result).to eq(content)

      # allow(file_hub.night_writer).to receive(:translate_to_braille).and_return("0.0.00\n00.0.0\n....00")
  
      # expect(file_hub.read_message).to eq("0.0.00\n00.0.0\n....00")
      allow(file_hub.night_writer).to receive(:translate_to_braille).and_return(content)
  
      expect(file_hub.read_message).to eq(content)
    end
  end

  describe '#translate_message_create_braille_file' do 
    it 'translates the message and creates a braille txt file' do 
      message = 'translated.txt'
      content = "0.0.00\n00.0.0\n....00"

      allow(File).to receive(:open).with(message, 'w').and_yield(StringIO.new(content))
      expect(StringIO.new(content).read).to eq(content)
      result = ""
      File.open('translated.txt', 'w') {|f| result = f.write}
      
      allow(file_hub.night_writer).to receive(:translate_to_braille).and_return("0.0.00\n00.0.0\n....00")
  
      expect(file_hub.read_message).to eq("0.0.00\n00.0.0\n....00")
    end
  end
end