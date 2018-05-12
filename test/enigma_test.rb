require 'MiniTest/autorun'
require 'MiniTest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Unit::TestCase

  def test_if_enigma_class_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_encryption_with_one_param
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message)
    assert_equal "byvasz5sa5kazt4zboltz4qtt", output
  end

  # def test_encryption_with_one_param
  #   # @observer = MiniTest::Mock.new
  #   # output = ""
  #   # e = Enigma.new
  #   # my_message = "this is so secret ..end.."
  #   # @observer.expect(:changed, true, output)
  #   # output = e.encrypt(my_message)
  #   # @observer.verify
  # end


end # end class
