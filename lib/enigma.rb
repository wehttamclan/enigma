require './lib/date'
require './lib/key_generator'

class Enigma
  attr_reader :char_map, :characters, :keygen, :offset

  def initialize
    lowercase = ('a'..'z').to_a.join
    uppercase = ('A'..'Z').to_a.join
    numbers = (0..9).to_a.join
    symbols = ' !@#$%^&*()[],.<>;:/?\|'
    @characters = lowercase + uppercase + numbers + symbols
    @char_map = characters.length.times.zip(characters.chars).to_h
    @keygen = KeyGenerator.new
    @offset = @keygen.calc_offset(date_today)
  end

  def date_today
    Date.new.today
  end

  def total_shift(key)
    rotations = keygen.rotations(key)
    shift = []
    4.times { |num| shift << (rotations[num] + offset[num]) }
    shift
  end

  def encrypt(plaintext, key=keygen.key, today=date_today)
    shift = total_shift(key)
    cipher(plaintext, total_shift(key), 1)
  end

  def decrypt(encrypted_text, key, today=date_today)
    shift = total_shift(key)
    cipher(encrypted_text, total_shift(key), -1)
  end

  def cipher(input_text, shift, i)
    map_length = char_map.length # 85
    output_text = ""

    input_text.length.times do |x|
      char_map_position = char_map.key(input_text[x])
      cipher_char_map_position =
            (i*i*char_map_position + i*shift[x % 4]) % map_length
      output_text += char_map[cipher_char_map_position]
      # require 'pry'; binding.pry
    end
    output_text
  end
end



e = Enigma.new
p k = e.keygen.key
# p e.keygen.rotations(k)
# p e.offset
# p e.total_shift(k)
message = "1234567890qwertyuiop[]asdfghjkl;zxcvbnm,. !@#$%^&*()[],.<>;:/?\|"
p ciphertext = e.encrypt(message, key = k)
p e.decrypt(ciphertext, key = k)
