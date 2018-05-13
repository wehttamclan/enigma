require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_if_encrypt_class_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_files_exist
    result = `ruby ./lib/encrypt.rb message.txt encrypted.txt`
    assert File.exist?('./encrypted.txt') # okay with this failing for now
    assert File.exist?('./message.txt')
  end

  def test_check_corect_num_arguments
    skip
    result_1 = `ruby ./lib/encrypt.rb message.txt encrypted.txt`
    expected_1 = "Created 'encrypted.txt' with the key ***** and date ******"
    assert expected_1, result_1

    result_2 =  `ruby ./lib/encrypt.rb message.txt`
    expected_2 = "Incorect number of arguments. Please try again: "
    assert expected_2, result_2
  end
end
