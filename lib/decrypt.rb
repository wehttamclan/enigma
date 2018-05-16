require './lib/file_manager'
require './lib/enigma'
require './lib/key_generator'
require './lib/date'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
key = keygen.key
encrypted_message = f.open_file
key = ARGV[2] # key
date = ARGV[3] # date
decrypted_message = e.decrypt(encrypted_message, key, date)
f.write_file(decrypted_message)
puts "Created #{f.assign_filenames[1]} with the key #{key} and the date "\
  + "#{date}"
#3zxeh07w26meou633pnxo5sxi
