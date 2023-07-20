def decode_char(data)
  alphabet = { '.-' => 'A', '-...' => 'B', '-.-.' => 'C',
               '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
               '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K',
               '.-..' => 'L', '--' => 'M', '-.' => 'N', '---' => 'O',
               '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S',
               '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W',
               '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z', '.----' => '1',
               '..---' => '2', '...--' => '3', '....-' => '4', '.....' => '5',
               '-....' => '6', '--...' => '7', '---..' => '8', '----.' => '9',
               '-----' => '0' }
  alphabet[data]
end

def decode_word(word)
  new_word = ''
  characters = ''
  word.each_char do |ch|
    if ch == ' '
      if characters.length.positive?
        new_word += decode_char characters
        characters = ''
      end
    else
      characters += ch
    end
  end
  new_word += decode_char characters if characters.length.positive?
  new_word
end

def decode(str)
  words = str.split('   ')
  decoded_words = ''
  words.each do |w|
    decoded_words += "#{decode_word(w)} "
  end
  decoded_words
end

print decode('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
