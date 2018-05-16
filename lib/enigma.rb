require './lib/date'
require './lib/key_generator'

class Enigma
  attr_reader :char_map, :characters, :keygen, :new_key, :offset

  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = characters.length.times.zip(characters.chars).to_h
    @keygen = KeyGenerator.new
    @offset = @keygen.calc_offset(date_today)
  end

  def date_today
    Date.new.today
  end

  def total_shift
    rotations = keygen.rotations(keygen.key)
    shift = []
    4.times { |num| shift << (rotations[num] + offset[num]) }
    shift
  end

  def encrypt(plaintext, key=keygen.key, today=date_today)
    cipher(plaintext, total_shift, 1)
  end

  def decrypt(encrypted_text, key=keygen.key, today=date_today)
    cipher(encrypted_text, total_shift, -1)
  end

  def cipher(input_text, rotations, i)
    map_length = char_map.length # 39
    output_text = ""

    input_text.length.times do |x|
      char_map_position = char_map.key(input_text[x])
      cipher_char_map_position =
            (i*i*char_map_position + i*rotations[x % 4]) % map_length
      output_text += char_map[cipher_char_map_position]
    end
    output_text
  end
end # end class

# e = Enigma.new
# message = "this is so secret ..end.."
# p new_key = e.keygen.key
# p ciphertext = e.encrypt(message, key=new_key)
# p e.decrypt(ciphertext, key=new_key)
# p e.keygen.rotations(e.keygen.key)
# p e.offset
