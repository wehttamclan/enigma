require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_if_encrypt_class_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_file_names_assigned
    skip
    encrypt = Encrypt.new
    assert 'ARGV[0]'
  end

  def test_encrypted_file_exists
    encrypt = Encrypt.new
    encrypt.assign_filenames
    File.exist(encrypt.ARGV[0])
  end

end
