require './lib/file_hub'
require './lib/night_writer'
require './lib/night_reader'
require './lib/dictionary'
require './lib/translator'

file = FileHub.new 

file.read_message
file.translate_message_create_braille_file