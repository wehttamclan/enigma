require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_manager'

class FileManager
  def test_files_exist
    `ruby ./lib/encrypt.rb ./data/message.txt ./data/encrypted.txt`

class FileManagerTest < Minitest::Test
  def test_files_exist
    assert File.exist?('./data/encrypted.txt')
    assert File.exist?('./data/message.txt')
  end
end
