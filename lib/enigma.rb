require 'Date'
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
    @offset = @keygen.calc_offset(date = Date.today)
  end

  def total_shift(key)
    rotations = keygen.rotations(key)
    shift = []
    4.times { |num| shift << rotations[num] + offset[num].to_i }
    shift
  end

  def encrypt(plaintext, key = keygen.key, _today = Date.today)
    shift = total_shift(key)
    cipher(plaintext, total_shift(key), 1)
  end

  def decrypt(encrypted_text, key, _today = Date.today)
    shift = total_shift(key)
    cipher(encrypted_text, total_shift(key), -1)
  end

  def cipher(input_text, shift, switch)
    map_length = char_map.length # 85
    output_text = ''

    input_text.length.times do |count|
      char_map_position = char_map.key(input_text[count])
      cipher_char_map_position =
        (char_map_position + switch * shift[count % 4]) % map_length
      output_text += char_map[cipher_char_map_position]
    end
    output_text
  end

  def crack(ouput, date = Date.today)
    # pass decrypt the keys 00000, 00001...00010, 00011, etc.
    rotating_key = '00000'
    encrypted_str = IO.read(ARGV[0])
    if date
      date = (Time.now.strftime '%d%m%y').to_i
    else
      date = ARGV[1]
    end
    last_four = encrypted_str.reverse[0..3].reverse # nd.. equiv.
    99_999.times do
      rotating_str = decrypt(last_four, rotating_key, date)
      rotating_key = rotating_key.to_i + 1
      if rotating_str == 'nd..'
        puts decrypt(encrypted_str, rotating_key, date)
      end
    end
  end
end
