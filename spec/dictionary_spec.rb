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
      expect(braille_characters.keys).to include("a", "b", "c", "l", "m", "n")
      expect(braille_dictionary.class).to be_a(Hash)
    end
  end
end