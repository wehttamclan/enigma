require './lib/enigma'
require 'pry'
require 'Date'

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
    key = key.to_s
    4.times do |index|
      rotations << key[index..index + 1].to_i
    end
    rotations
  end

  def calc_offset(date = Date.today)
    if date == Date.today
      date = modify_date
    end
    # binding.pry
    date_squared = (date**2).digits
    date_squared.reverse[-4..-1].join
  end

  def modify_date
      (Time.now.strftime '%d%m%y').to_i
  end
end
