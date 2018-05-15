module Cipher

  def date_today
    Date.new.today
  end

  def encrypt(plaintext, key=41521, today=date_today)
    rotations = []
    offset = calc_offset(today)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(plaintext, rotations, 1)
  end

  def decrypt(encrypted_text, key=41521, today=date_today)
    rotations = []
    offset = calc_offset(today)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(encrypted_text, rotations, -1)
  end

  def calc_offset(date)
    if date > 0
      (date**2).to_s[-4..-1].chars.map { |digit| digit.to_i }
    else
      000000
    end
  end

  def cipher(input_text, rotations, i)
    characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    char_map = characters.length.times.zip(characters.chars).to_h
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
end