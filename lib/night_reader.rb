class NightReader 
  attr_reader :translator 

  def initialize
    @translator = Translator.new
  end 
end