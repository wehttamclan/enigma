require './lib/file_manager'
require './lib/enigma'
require './lib/key_generator'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
key = keygen.key
my_message = f.open_file
encrypted_message = e.encrypt(my_message)
f.write_file(encrypted_message)
#3zxeh07w26meou633pnxo5sxi

# print the key to the terminal so decrypt can use it.
