require './lib/date'
require 'pry'

class Enigma
attr_reader :char_map, :characters

  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = @characters.length.times.zip(characters.chars).to_h
  end

  def encrypt(plaintext, key=41521, date=0)
    rotations = []
    offset = offset(date)
    4.times { |x| rotations << key.to_s[x..x+1].to_i + offset[x] }
    cipher(plaintext, rotations)
  end

  def offset(date)
    if date > 0
      (date**2).to_s[-4..-1].chars.map { |x| x.to_i }
    else
      000000
    end
  end

  def cipher(plaintext, rotations)
    map_length = characters.length # 39
    ciphertext = ""

    plaintext.length.times do |x|
      char_map_position = char_map.key(plaintext[x])
      cipher_char_map_position =
            (char_map_position + rotations[x % 4]) % map_length
      ciphertext += char_map[cipher_char_map_position]
    end

    ciphertext
  end

end # end class







# e = Enigma.new
# d = Date.new
# my_message = "this is so secret ..end.."
# p e.encrypt(my_message)
# p e.encrypt(my_message, 41521, d.today)


# def decrypt (output, str, Date.today)
# end
#
# def crack (output, Date.today)
# end



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
