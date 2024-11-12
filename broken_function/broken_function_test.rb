require 'minitest/autorun'
require_relative 'broken_function'

class TestMyFunctions < Minitest::Test
  def setup
    @functions = BrokenFunctions.new
  end

  def test_odd_even
    assert_output("Even number.\n") { @functions.odd_even(100) }
    assert_output("Odd number.\n") { @functions.odd_even(101) }
  end

  def test_is_prime
    assert_equal true, @functions.is_prime(101)
    assert_equal false, @functions.is_prime(100)
  end

  def test_find_longest_and_shortest_words
    words = ['banana', 'apple', 'pineapple', 'strawberry', 'orange', 'lime']
    res = @functions.find_longest_and_shortest_words(words)
    assert_equal 'lime', res[0]        # shortest word
    assert_equal 'strawberry', res[1]  # longest word
  end
end

