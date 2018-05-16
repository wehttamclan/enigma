require 'pry'

class KeyGenerator

  def key
    key = []
    5.times do
      key << rand(0..9).to_s # accounts for leading zero
    end
    key.join
  end

  def rotations(key)
    rotations = []
    4.times do |index| # 0, 1, 2, 3
      rotations << key[index..index + 1].to_i
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
