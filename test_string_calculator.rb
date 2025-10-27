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

  def test_newline_delimiter
    assert_equal 6, add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, add("//;\n1;2")
  end

  def test_negative_number
    assert_raises(RuntimeError, "negative numbers not allowed -2") do
      add("1,-2")
    end
  end

  def test_multiple_negative_numbers
    assert_raises(RuntimeError, "negative numbers not allowed -2,-3") do
      add("1,-2,-3,4")
    end
  end
end
