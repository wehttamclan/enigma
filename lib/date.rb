class Date
attr_reader :t

  def initialize
    @t = Time.now
  end

  def today
    (t.strftime "%d%m%y").to_i
  end

end


# p Date.new.today
