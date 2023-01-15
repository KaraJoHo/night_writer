class Translator 
  attr_reader :dictionary, :braille_characters, :back_to_braille, :formatted_braille_string

  def initialize 
    @dictionary = Dictionary.new 
    @braille_characters = dictionary.braille_dictionary
    @english_characters = dictionary.to_english
    @formatted_braille_string = ""
    @back_to_braille =[]
  end

  def eng_to_braille(message)
    message.downcase.chars.map do |char| 
      if @braille_characters.include?(char)
       @braille_characters[char]
      end
    end
  end

  def format_the_translation(translated_message)
    format_arr = []
    line_1 = []
    line_2 = []
    line_3 = []
    count = 0
    translated_message.map do |braille_char|
      
      line_1 << braille_char[0]
      line_2 << braille_char[1]
      line_3 << braille_char[2]

      format_arr << ([line_1, line_2, line_3])
    end

    format_arr.flatten(1).each do |line|  
      count += 1
      @formatted_braille_string << line.join + "\n"
      break if count == 3
    end
    @formatted_braille_string.rstrip
    splitted = @formatted_braille_string.rstrip.split("\n")
    map_scan = splitted.map {|s| s.scan(/.{1,80}/).join("\n")}
    transposed_it = map_scan.map {|s| s.split("\n")}.transpose
    out_putted = transposed_it.map {|a| a.join("\n")}.join("\n")
  end

  def revert_to_braille(translated_message)
    remove_newline = translated_message.split("\n")
    combine_to_split_string = remove_newline.join
    chunks_of_three = remove_newline.each_slice(3).to_a
    pairs = chunks_of_three.flat_map {|arr| arr.map {|s| s.chars.each_slice(2).to_a}.transpose}
    turn_to_braille_arrays = pairs.map {|arr| arr.flatten(1)}
    format_braille_arrays = turn_to_braille_arrays.map {|arr| arr.each_slice(2).to_a.map{|a| a.join}}
    @back_to_braille = format_braille_arrays
  end

  def braille_to_eng(message)
    reverted_to_braille_array = revert_to_braille(message)
    reverted_to_braille_array.map do |br| 
      if @english_characters.include?(br)
       @english_characters[br]
      end
    end.join
  end
end