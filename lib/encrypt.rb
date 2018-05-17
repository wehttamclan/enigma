require './lib/file_manager'
require './lib/enigma'
require 'pry'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
key = e.keygen.key
my_message = f.read_file
encrypted_message = e.encrypt(my_message, key)
f.write_file(encrypted_message)
puts "Created #{f.assign_filenames[1]} with the key #{key} and date "\
 + e.date_today.to_s
