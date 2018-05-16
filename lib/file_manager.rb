class FileManager

  def assign_filenames
    input_text_file = ARGV[0]
    output_text_file = ARGV[1]
    [input_text_file, output_text_file]
  end

  def read_file(file = assign_filenames[0])
    IO.read(file).chomp
  end

  def write_file(output_file = assign_filenames[1], output_text)
    IO.write(output_file, output_text)
  end
end
