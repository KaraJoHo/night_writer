class NightReader 
  attr_reader :translator 

  def initialize
    @translator = Translator.new
  end 

  def translate_to_english(message)
    tr_message = @translator.braille_to_eng(message)
  end
end