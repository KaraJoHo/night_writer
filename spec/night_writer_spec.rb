require_relative 'spec_helper'

RSpec.describe NightWriter do 
  let(:night_writer) {NightWriter.new}

  describe '#initialize' do 
    it 'exists and has a translator' do 
      night_writer = NightWriter.new 
      translator = Translator.new 

      expect(night_writer).to be_a(NightWriter)
      expect(night_writer.translator).to be_a(Translator)
    end
  end

end