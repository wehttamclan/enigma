
class Enigma
attr_reader :char_map
  def initialize
    @char_map   = {1 => "a",
                   2 => "b",
                   3 => "c",
                   4 => "d",
                   5 => "e",
                   6 => "f",
                   7 => "g",
                   8 => "h",
                   9 => "i",
                   10 => "j",
                   11 => "k",
                   12 => "l",
                   13 => "m",
                   14 => "n",
                   15 => "o",
                   16 => "p",
                   17 => "q",
                   18 => "r",
                   19 => "s",
                   20 => "t",
                   21 => "u",
                   22 => "v",
                   23 => "w",
                   24 => "x",
                   25 => "y",
                   26 => "z",
                   27 => "0",
                   28 => "1",
                   29 => "2",
                   30 => "3",
                   31 => "4",
                   32 => "5",
                   33 => "6",
                   34 => "7",
                   35 => "8",
                   36 => "9",
                   37 => " ",
                   38 => ".",
                   39 => ","}
  end

  def encrypt#(plaintext)
    key = 99521
    plaintext = "this is so secret ..end.."

    mod = char_map.keys.length # 39
    a_rotation = key.to_s[0..1].to_i # 99
    b_rotation = key.to_s[1..2].to_i # 95
    c_rotation = key.to_s[2..3].to_i # 52
    d_rotation = key.to_s[3..4].to_i # 21
    # plaintext.chars
    cipher_chars = []

    plaintext.chars.to_a.each do |char|
      cipher_chars <<  char_map[char_map.key(char) + a_rotation % char_map.keys.length]
    end

    p cipher_chars
  end

end

e = Enigma.new
e.encrypt

#
#
# end
#
# char_map.keys.length
#
# def encrypt(my_message)
#
# end
#
# def decrypt (output, str, Date.today)
#
# end
#
# def crack (output, Date.today)
#
# end

# digits = [1,2,3,4,5,6,7,8,9,0]
#
# 5.times do |x|
#   digits.sample
# end
