require './test/test_helper'
require './lib/file_manager.rb'

class FileManagerTest < Minitest::Test
  def test_files_exist
    assert File.exist?('./data/encrypted.txt')
    assert File.exist?('./data/message.txt')
  end
end
