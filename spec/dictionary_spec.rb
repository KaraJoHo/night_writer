require_relative 'spec_helper'

RSpec.describe Dictionary do 
  let(:dictionary) {Dictionary.new}

  describe '#initialize' do 
    it 'exists' do 
      expect(dictionary).to be_a(Dictionary)
    end
  end
end