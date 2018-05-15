require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/cipher'
require './lib/date'

class EncryptTest < Minitest::Test

  def test_encryption_with_different_params
    e = Encrypt.new
    assert_equal e.encrypt("sdasfd"), "2vpepv"
    assert_equal e.encrypt("..end.."), "2vpepv"
    p e.encrypt("hippopatamus", 12345)
    p e.decrypt("18mz8c 3u,r2", 12345)
  end

  def test_if_encrypt_class_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_check_corect_num_arguments
    skip
    result_1 = `ruby ./lib/encrypt.rb message.txt encrypted.txt`
    expected_1 = "Created 'encrypted.txt' with the key ***** and date ******"
    assert expected_1, result_1

    result_2 =  `ruby ./lib/encrypt.rb message.txt`
    expected_2 = "Incorect number of arguments. Please try again: "
    assert expected_2, result_2

    def test_correct_num_args_from_command_line
      if ARGV.length != 2
        print "Incorrect number of arguments. Please try again: "
      end
    end
  end
end
