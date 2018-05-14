require './lib/enigma'

class Encrypt

  def check_correct_num_arguments
    if ARGV.length != 2
      print "Incorrect number of arguments. Please try again: "
    end
  end

  def assign_filenames
    plaintext_file_name = ARGV[0]
    ciphertext_file_name = ARGV[1]
    [plaintext_file_name, ciphertext_file_name]
  end
end
