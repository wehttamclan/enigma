require './lib/file_manager'
require './lib/enigma'
require './lib/date'

e = Enigma.new
f = FileManager.new
encrypted_message = f.read_file
decrypted_message = e.decrypt(encrypted_message, ARGV[2], date = Date.today)
f.write_file(decrypted_message)
puts "Created #{f.assign_filenames[1]} with the key #{ARGV[2]} and the date "\
  + "#{ARGV[3]}" # date
