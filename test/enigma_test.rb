require 'MiniTest/autorun'
require 'MiniTest/pride'
require './lib/enigma'
require 'MiniTest/mock'
require './lib/key_generator'

class EnigmaTest < Minitest::Test

  def test_encryption
    e = Enigma.new
    key = 41521
    date = Date.new
    my_message = "a"
    a_rotation = e.char_map.key(41)

    output = e.encrypt(my_message)
    assert_equal a_rotation, output
  end

  def test_return_correct_offset
    e = Enigma.new
    output = e.calc_offset(0)
    expected = [0, 0, 0, 0]
    assert_equal expected, output


    date = 150518 # May 15, 2018
    output = e.calc_offset(date.today)
    expected = [8, 3, 2, 4] # May 15, 2018 -> (150518**2).digits.reverse[-4..-1]
    assert_equal expected, output
  end
end # end class
