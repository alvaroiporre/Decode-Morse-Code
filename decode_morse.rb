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
  decode = ''
  character = ''
  spaces = 0
  word.each_char do |ch|
    if ch == ' '
      spaces += 1
      if character.length.positive?
        decode += decode_char character
        character = ''
      end
    else
      character += ch
      decode += ' ' if spaces > 1
      spaces = 0
    end
  end
  decode += decode_char character if character.length.positive?
  decode
end

print "#{decode_word('-- -.--   -. .- -- .')}\n"
print decode_word('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
