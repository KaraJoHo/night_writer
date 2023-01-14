class NightWriter 
  attr_reader :translator 

  def initialize
    @translator = Translator.new
  end 

  def translate_to_braille(message)
    tr_message = @translator.eng_to_braille(message)
    @translator.format_the_translation(tr_message)
  end
end