require 'pry'
require './lib/file_manager'
require './lib/enigma'

class Crack
  attr_reader :abcd, :char_map

  def initialize
    @abcd = 0 # Looks weird because cuts off leading zeros
    e = Enigma.new # only use char_map
    @char_map = e.char_map
  end

  def crack
    char_map = 85
    9999.times do |i|
      add_one_to_abcd # pads zeros
      rotate
      # if the last seven characters of the encrypted file
      # if last_seven
    end
  end

  def read_last_seven_encrypted
    encrypted_str = IO.read('./data/encrypted.txt')
    end_str = ".end"
    last_seven = (encrypted_str.reverse[0..6]).reverse # ..end..
  end

  def add_one_to_abcd
    @abcd += 1
    @abcd = @abcd.to_s.rjust(5, "0")
  end

  def rotate
    num_to_rotate = []
    arr = []
    char = ""
    temp = 0
    char_location = 0
    last_seven = read_last_seven_encrypted
    end_str = "..end.."

    while arr.join.to_s != "..end.."
      arr = []
      last_seven.chars.map.with_index do |char, index|
        num_to_rotate << @abcd[index]
        char_location = @char_map.key(char)
        temp = num_to_rotate[index].to_i + char_location
        arr << @char_map[temp]
        if arr == last_seven.chars
          puts "You solved it!"
        end
        if arr.length == 4
          p arr
          sleep(1)
        end
      end
    end
  end
end


  crack = Crack.new
  crack.crack
