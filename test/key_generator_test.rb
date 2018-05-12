require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_if_key_generator_class_exists
    keygen = KeyGenerator.new
    assert_instance_of KeyGenerator, keygen
  end

  def test_if_valid_mac_address
    skip
    keygen = KeyGenerator.new
    expected =
    assert lines, what_do_i_put_here?, keygen.get_mac_address_from_shell
  end

  def test_convert_hex_to_decimal(mac_address)
    keygen = KeyGenerator.new
    keygen.convert_hex_to_decimal mac_address
  end
end

# http://www.grymoire.com/Unix/Sed.html#uh-0

# use sed for command line encrypt/decrypt
