class KeyGenerator

  def key
    (Time.now.strftime "%H%m%S")[-5..-1].to_i
  end

  def rotations(key)
    rotations = []
    key = key.to_s
    4.times do |digit|
      rotations << key[digit..digit + 1].to_i
    end
    rotations
  end

  def calc_offset(date)
    date_squared = (date**2).digits
    date_squared.reverse[-4..-1]
  end
end



# keygen = KeyGenerator.new
# p keygen.key
# p keygen.rotations(keygen.key)
