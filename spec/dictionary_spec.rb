require_relative 'spec_helper'

RSpec.describe Dictionary do 
  let(:dictionary) {Dictionary.new}

  describe '#initialize' do 
    it 'exists' do 
      expect(dictionary).to be_a(Dictionary)
    end
  end

  describe '#braille_dictionary and braille_characters' do 
    it 'is initialized with a dictionary of braille characters' do 
      expect(dictionary.braille_characters.keys).to include("a", "b", "c", "l", "m", "n")
      expect(dictionary.braille_characters.values).to include(["0.", "..", ".."], ["00", "00", ".."])
      expect(dictionary.braille_dictionary).to be_a(Hash)
    end
  end

  describe '#to_english and english_characters' do 
    it 'is initialized with a dictionary of braille to english characters' do 
      expect(dictionary.english_characters.keys).to include(["0.", "..", ".."], ["00", "00", ".."])
      expect(dictionary.english_characters.values).to include("a", "b", "c", "l", "m", "n")
      expect(dictionary.to_english).to be_a(Hash)
    end
  end
end