require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_if_key_generator_class_exists
    keygen = KeyGenerator.new
    assert_instance_of KeyGenerator, keygen
  end

  def test_if_rotations_method_returns_rotations
    keygen = KeyGenerator.new
    result = keygen.rotations(12345)
    expected = [12, 23, 34, 45]

    assert_equal expected, result
  end

  def test_if_calc_offset_method_returns_correct_offset
    keygen = KeyGenerator.new
    result = keygen.calc_offset(160518)
    expected = [8324]

    assert_equal expected, result
  end

end
