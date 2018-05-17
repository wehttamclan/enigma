require './test/test_helper'
require './lib/date'

class EnigmaTest < Minitest::Test
  def test_format_date
    date = Date.new
    assert_instance_of Date, date

    today = Date.new.today
    assert_instance_of Integer, today
    assert_equal 6, today.digits.length
  end
end
