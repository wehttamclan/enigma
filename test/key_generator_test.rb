require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_if_key_generator_class_exists
    keygen = KeyGenerator.new
    assert_instance_of KeyGenerator, keygen
  end

  def test_convert_hex_to_decimal
    keygen = KeyGenerator.new
    keygen.get_mac_address_from_shell

    expected = 255
    result = keygen.convert_hex_to_decimal('ff')
    assert expected, result
  end

  def test_get_first_five
    keygen = KeyGenerator.new

    result = keygen.get_first_five(123456)
    expected = 12345
    assert expected, result
    # assert keygen.mac_address,
  end
end

# http://www.grymoire.com/Unix/Sed.html#uh-0

# use sed for command line encrypt/decrypt
