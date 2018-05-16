require './lib/file_manager'
require './lib/enigma'
require './lib/key_generator'

f = FileManager.new
keygen = KeyGenerator.new
key = keygen.key
my_message = f.open_file(file = ARGV[0])
encrypted_message = e.decrypt(my_message)
f.write_file(decrypted_message)
#3zxeh07w26meou633pnxo5sxi
