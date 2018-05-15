require 'minitest/autorun'
require 'minitest/pride'
require './file_manager.rb'

class asfdkjlsa
  import FileManager

  def test_files_exist
    result = `ruby ./lib/encrypt.rb message.txt encrypted.txt`
    assert File.exist?('./encrypted.txt') # okay with this failing for now
    assert File.exist?('./message.txt')
  end

end
