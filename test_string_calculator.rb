require 'minitest/autorun'
require './string_calculator'

class TestStringCalculator < Minitest::Test
  def test_empty_string
    assert_equal 0, add("")
  end

  def test_single_number
    assert_equal 1, add("1")
  end
end
