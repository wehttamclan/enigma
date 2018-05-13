require 'MiniTest/autorun'
require 'MiniTest/pride'
require './lib/enigma'
require 'MiniTest/mock'

class EnigmaTest < Minitest::Unit::TestCase

  def test_if_enigma_class_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_encryption
    e = Enigma.new  # key = 41521
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message)
    assert_equal "vwva,x5su3kagr4zvmltg2qta", output
    d = Date.new
    output = e.encrypt(my_message, 41521, d.today)
    assert_equal "3zxeh07w26meou633pnxo5sxi", output
  end

  def test_command_line_encrypt
    smock = mock('name')
  end

  #object.expects(:method).returns("expected")


end # end class
