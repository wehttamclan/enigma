require 'pry'
require './lib/file_manager'

class Crack
  attr_reader :ABCD

  def initialize
    abcd = 0 # Looks weird because cuts off leading zeros
  end

  def crack
    permutations = permutate
    char_map = 85
    last_seven = read_last_seven_encrypted
    permutations.each do |perm|
      9999.times do |i|
        # If the last seven characters of the encrypted file
        last_seven.chars do |i|
        last_seven = rotate(last_seven)
      end
      if last_seven 
    end
  end

  def read_last_seven_encrypted
    encrypted_str = IO.read('./data/encrypted.txt')
    end_str = ".end"
    last_seven = (encrypted_str.reverse[0..6]).reverse # ..end..
  end

  def rotate(last_seven)
    abcd += 1
    abcd.to_s.rjust(5, "0").to_i
  end
end

  crack = Crack.new
  crack.crack
