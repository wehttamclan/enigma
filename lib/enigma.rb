require './lib/date'
require './lib/key_generator'

class Enigma
  attr_reader :char_map, :characters, :keygen

  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = characters.length.times.zip(characters.chars).to_h
    @keygen = KeyGenerator.new
  end

  def date_today
    Date.new.today
  end

  def encrypt(plaintext, key=41521, today=date_today)
    rotations = []
    offset = keygen.calc_offset(today)
    #rename x, clean up line
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(plaintext, rotations, 1)
  end

  def decrypt(encrypted_text, key=41521, today=date_today)
    rotations = []
    offset = keygen.calc_offset(today)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(encrypted_text, rotations, -1)
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

# 3ztw3d6zx53ek,6g2p637pxeh.w3h43e3p9,nw6dk.t2h6uwk30w3ztwn02a2s9d2
# p e.decrypt(var)
# tyrannosaur
