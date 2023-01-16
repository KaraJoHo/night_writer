require './lib/file_hub'
require './lib/night_writer'
require './lib/night_reader'
require './lib/dictionary'
require './lib/translator'

file = FileHub.new 

file.read_braille_message
file.revert_message_create_original_text_file