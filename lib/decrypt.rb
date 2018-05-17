require './lib/file_manager'
require './lib/enigma'
require './lib/date'

e = Enigma.new
f = FileManager.new
keygen = KeyGenerator.new
encrypted_message = f.read_file
key = ARGV[2] # key
date = ARGV[3] # date
decrypted_message = e.decrypt(encrypted_message, key, date=Date.new.today)
f.write_file(decrypted_message)
puts "Created #{f.assign_filenames[1]} with the key #{key} and the date "\
  + "#{date}"
