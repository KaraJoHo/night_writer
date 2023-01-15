class FileHub 
  attr_reader :night_writer, :night_reader, 
              :translated_to_braille, :translated_to_english

  def initialize
    @night_writer = NightWriter.new 
    @night_reader = NightReader.new 
    @translated_to_braille = ""
    @translated_to_english = ""
  end

end