require './lib/file_manager'
require './lib/enigma'
require './lib/key_generator'
require 'pry'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
key = keygen.key
my_message = f.read_file
encrypted_message = e.encrypt(my_message)
f.write_file(encrypted_message)
#3zxeh07w26meou633pnxo5sxi
puts "Created #{f.assign_filenames[1]} with the key #{keygen.key}"
