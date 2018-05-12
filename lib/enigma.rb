
class Enigma
attr_reader :char_map, :characters
  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = @characters.length.times.zip(characters.chars).to_h
  end

  def encrypt(plaintext)
    key = 99521

    map_length = @characters.length # 39
    a_rotation = key.to_s[0..1].to_i # 99
    b_rotation = key.to_s[1..2].to_i # 95
    c_rotation = key.to_s[2..3].to_i # 52
    d_rotation = key.to_s[3..4].to_i # 21

    ciphertext = ""

    plaintext.chars.to_a.each do |char|
      char_position = char_map.key(char)
      cipher_char_position = (char_position + a_rotation) % map_length
      ciphertext += char_map[cipher_char_position]
    end

    p ciphertext
  end

end

# e = Enigma.new
# my_message = "this is so secret ..end.."
# e.encrypt(my_message)


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
