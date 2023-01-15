require_relative 'spec_helper'

RSpec.describe FileHub do 
  let(:file_hub) {FileHub.new}
  let(:english_txt) {'./spec/fixtures/english_message.txt'}
  let(:braille_translation) {'./spec/fixtures/braille_translated.txt'}
  let(:original_message) {'./spec/fixtures/original.txt'}

  describe '#initialize' do 
    it 'exists and has a night reader, night writer and translated message attributes' do 
      expect(file_hub).to be_a(FileHub)
      expect(file_hub.night_writer).to be_a(NightWriter)
      expect(file_hub.night_reader).to be_a(NightReader)
      expect(file_hub.translated_to_braille).to eq("")
      expect(file_hub.reverted_to_english).to eq("")
    end
  end

  describe '#read_message' do 
    it 'reads the message and translates english to braille' do 
      ARGV[0] = english_txt
      ARGV[1] = braille_translation
      
      message = File.read(ARGV[0])
      expect(message).to eq('Hey') 

      new_file = ARGV[1]
      expect(new_file).to eq('./spec/fixtures/braille_translated.txt')

      expect(message.chars.count).to eq(3)
      expect(file_hub.read_message).to eq("0.0.00\n00.0.0\n....00")
      expect(file_hub.read_message.class).to eq(String)
    end
  end

  describe '#translate_message_create_braille_file' do 
    it 'translates the message and creates a braille txt file' do 
      ARGV[0] = english_txt
      message = File.read(ARGV[0])

      expect(message).to eq('Hey') 
      file_hub.read_message

      translated_file = ARGV[1]
      write_to = File.open(translated_file, "w")
     
      write_to.write(file_hub.translated_to_braille)
      write_to.close

      expect(translated_file).to eq('./spec/fixtures/braille_translated.txt')
      expect(file_hub.translated_to_braille).to eq("0.0.00\n00.0.0\n....00")
      expect(file_hub.translate_message_create_braille_file).to eq(nil)

    end
  end

  describe '#read_braille_message' do 
    it 'reads the braille message to translate back to english' do
       ARGV[0] = braille_translation
       ARGV[1] = original_message 

      message = File.read(ARGV[0])
      expect(message).to eq("0.0.00\n00.0.0\n....00") 

      new_file = ARGV[1]
      expect(new_file).to eq('./spec/fixtures/original.txt')

      expect(file_hub.read_braille_message).to eq("hey")
      expect(file_hub.read_braille_message.class).to eq(String)
    end
  end

  describe '#revert_message_create_original_text_file' do 
    it 'translates braille back to english' do 
      ARGV[0] = braille_translation
      message = File.read(ARGV[0])

      expect(message).to eq("0.0.00\n00.0.0\n....00") 
      file_hub.read_braille_message

      translated_file = ARGV[1]
      write_to = File.open(translated_file, "w")
     
      write_to.write(file_hub.reverted_to_english)
      write_to.close

      expect(translated_file).to eq('./spec/fixtures/original.txt')
      expect(file_hub.reverted_to_english).to eq("hey")
      expect(file_hub.revert_message_create_original_text_file).to eq(nil)
    end
  end
end