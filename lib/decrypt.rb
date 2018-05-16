require './lib/file_manager'
require './lib/enigma'
require './lib/key_generator'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
key = keygen.key
encrypted_message = f.open_file
decrypted_message = e.decrypt(encrypted_message)
f.write_file(decrypted_message)
#3zxeh07w26meou633pnxo5sxi
