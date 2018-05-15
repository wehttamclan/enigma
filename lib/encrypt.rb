require './lib/file_manager'
require './lib/cipher'

class Encrypt
  include FileManager, Cipher
end
