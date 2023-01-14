class NightWriter 
  attr_reader :translator 

  def initialize
    @translator = Translator.new
  end 
end