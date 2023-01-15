class FileHub 
  attr_reader :night_writer, :night_reader, 
              :translated_to_braille, :translated_to_english

  def initialize
    @night_writer = NightWriter.new 
    @night_reader = NightReader.new 
    @translated_to_braille = ""
    @translated_to_english = ""
  end

  def read_message 
    message = File.read(ARGV[0])
    puts "created #{ARGV[1]} containing #{message.chars.count} characters."
    @translated_to_braille = @night_writer.translate_to_braille(message)
  end

  def translate_message_create_braille_file 
    send_translated_to_file = File.open(ARGV[1], "w")
    send_translated_to_file.write(@translated_to_braille)
    send_translated_to_file.close
  end

  def read_braille_message 
    message = File.read(ARGV[0])
    puts "created #{ARGV[1]} containing #{message.chars.count} characters."
    @reverted_to_english = @night_reader.translate_to_english(message)
  end

  def revert_message_create_original_text_file 
    send_reverted_to_file = File.open(ARGV[1], "w")
    send_reverted_to_file.write(@reverted_to_english)
    send_reverted_to_file.close
  end

end