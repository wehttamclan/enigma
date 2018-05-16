require './lib/date'
require 'pry'

class Enigma
attr_reader :char_map, :characters, :date_offset

  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = @characters.length.times.zip(characters.chars).to_h
    @date_offset = Date.new # move this to a module?
  end

  def encrypt(plaintext, key=41521, date_offset=0)
    rotations = []
    offset = calc_offset(date_offset)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(plaintext, rotations, 1)
  end

  def decrypt(encrypted_text, key=41521, date_offset=0)
    rotations = []
    offset = calc_offset(date_offset)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(encrypted_text, rotations, -1)
  end

  def calc_offset(date)
    if date > 0
      # (date**2).to_s[-4..-1].chars.map { |digit| digit.to_i }
      (date**2).digits.reverse[-4..-1]#.map { |digit| digit.to_i }
    else
      [0, 0, 0, 0]
    end
  end

  def cipher(input_text, rotations, i)
    map_length = characters.length # 39
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




e = Enigma.new
my_message = "birdbird"#{}"this is so secret ..end.."

key = 99999
d = Date.new
p d.today
p e.calc_offset(d.today)

p my_message = e.encrypt(my_message)
p e.decrypt(my_message)






# @char_map   = {0 => "a",
#                1 => "b",
#                2 => "c",
#                3 => "d",
#                4 => "e",
#                5 => "f",
#                6 => "g",
#                7 => "h",
#                8 => "i",
#                9 => "j",
#                10 => "k",
#                11 => "l",
#                12 => "m",
#                13 => "n",
#                14 => "o",
#                15 => "p",
#                16 => "q",
#                17 => "r",
#                18 => "s",
#                19 => "t",
#                20 => "u",
#                21 => "v",
#                22 => "w",
#                23 => "x",
#                24 => "y",
#                25 => "z",
#                26 => "0",
#                27 => "1",
#                28 => "2",
#                29 => "3",
#                30 => "4",
#                31 => "5",
#                32 => "6",
#                33 => "7",
#                34 => "8",
#                35 => "9",
#                36 => " ",
#                37 => ".",
#                38 => ","}
