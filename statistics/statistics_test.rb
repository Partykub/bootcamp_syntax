# statistics_test.rb
require 'minitest/autorun'
require_relative 'statistics'

class StatisticsTest < Minitest::Test
  def setup
    @data = [1, 2, 34, 68, 59, 34, 7, 93, 22, 89]
    @stats = Statistics.new(@data)
  end

  def test_find_max
    assert_equal 93, @stats.find_max
  end

  def test_find_min
    assert_equal 1, @stats.find_min
  end

  def test_average
    assert_in_delta 40.9, @stats.average
  end

  def test_mode
    assert_equal [34], @stats.mode
  end

  def test_even_numbers
    assert_equal [2, 34, 68, 34, 22], @stats.even_numbers
  end

  def test_count_vowels
    sentence = "Ruby is the best computer language in the world"
    assert_equal 14, @stats.count_vowels(sentence)
  end

  def test_factorial
    assert_equal 120, @stats.factorial(5)
  end

end

