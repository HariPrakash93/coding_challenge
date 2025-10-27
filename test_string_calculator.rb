require 'minitest/autorun'
require './string_calculator'

class TestStringCalculator < Minitest::Test
  def test_empty_string
    assert_equal 0, add("")
  end

  def test_single_number
    assert_equal 1, add("1")
  end

  def test_two_numbers
    assert_equal 6, add("1,5")
  end

  def test_multiple_numbers
    assert_equal 10, add("1,2,3,4")
  end
end
