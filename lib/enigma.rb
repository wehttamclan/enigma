require './lib/date'
require './lib/cipher'
require 'pry'

class Enigma
  include Cipher
  attr_reader :char_map, :characters

  def initialize
    @characters = "abcdefghijklmnopqrstuvwxyz0123456789 .,"
    @char_map = @characters.length.times.zip(characters.chars).to_h
  end

end # end class

# this works!!!
# e = Enigma.new
# message = "this is so secret ..end.."
# p encrypted_text = e.encrypt(message)
# p e.decrypt(encrypted_text)

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
