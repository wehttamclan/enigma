class Date
attr_reader :time

  def initialize
    @time = Time.now
  end

  def today
    (time.strftime "%d%m%y").to_i
  end

end



# p Date.new.today
