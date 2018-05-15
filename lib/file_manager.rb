module FileManager

  def assign_filenames
    plaintext = ARGV[0]
    ciphertext = ARGV[1]
    [plaintext, ciphertext]
  end

  def open_plaintext_file
    content = File.read('./message.txt')
    File.write('./encrypted.txt', 'content goes here')
  end
end
