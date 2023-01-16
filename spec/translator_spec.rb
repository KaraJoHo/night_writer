require_relative 'spec_helper'

RSpec.describe Translator do 
  let(:translator) {Translator.new}
  let(:dictionary) {Dictionary.new}

  describe '#translator' do 
    it 'exists and has attributes' do 
      expect(translator).to be_a(Translator)
      expect(translator.dictionary).to be_a(Dictionary)
      expect(translator.braille_characters).to eq(dictionary.braille_dictionary)
      expect(translator.formatted_braille_string).to eq("")
      expect(translator.back_to_braille).to eq([])
    end
  end

  describe '#eng_to_braille' do 
    it 'take a string and translates it to braille' do 
      string = 'hey'

      expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["00", ".0", "00"]]

      expect(translator.eng_to_braille(string)).to eq(expected)
    end

    it 'can take capital letters and downcase them' do 
      string = 'Hey'

      expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["00", ".0", "00"]]

      expect(translator.eng_to_braille(string)).to eq(expected)
    end
     

  end

  describe '#format_the_translation' do 
    it 'takes the set of braille characters and formats them into 2x3 output' do 

      translated_message = [["0.", "00", ".."], ["0.", ".0", ".."], ["00", ".0", "00"]] 
      expected_format = "0.0.00\n00.0.0\n....00"                 
                         
      expect(translator.format_the_translation(translated_message)).to eq(expected_format)
    end
  end

  describe '#revert_to_braille' do 
    it 'reformats the output of braille, back to braille arrays to be translated to english' do 

      translated_message = "0.0.00\n00.0.0\n....00"
      expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["00", ".0", "00"]]

      translator.revert_to_braille(translated_message)
      expect(translator.back_to_braille).to eq(expected)
    end
  end

  describe '#braille_to_eng' do 
    it 'translates the braille back to english characters' do 

      translated_message = "0.0.00\n00.0.0\n....00"

      expect(translator.braille_to_eng(translated_message)).to eq('hey')
    end
  end

  describe '#format_lines' do 
    it 'formats the braille message and adds a line break if over 80 braille characters' do 
      translated_message = "0.0.00\n00.0.0\n....00"
      expect(translator.format_lines(translated_message)).to eq("0.0.00\n00.0.0\n....00")
    end
  end

  describe '#revert_sequence' do 
    it 'takes the translated braille string and reverts it back to english characters' do 
      translated_message = ["0.0.00", "00.0.0", "....00"]
      expect(translator.revert_sequence(translated_message)).to eq([["0.", "00", ".."], ["0.", ".0", ".."], ["00", ".0", "00"]])
    end
  end

  describe '#join_each_line_together' do 
    it 'takes the array of lines and joins them into one string' do 
      line_arrays = [[["0.", "0.", "00"], ["00", ".0", ".0"], ["..", "..", "00"]], [["0.", "0.", "00"], ["00", ".0", ".0"], ["..", "..", "00"]], [["0.", "0.", "00"], ["00", ".0", ".0"], ["..", "..", "00"]]]
      counter = 0
      expect(translator.join_each_line_together(line_arrays, counter)).to eq("0.0.00\n00.0.0\n....00\n")
    end
  end
end