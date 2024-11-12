class Statistics
  def initialize(numbers)
    @numbers = numbers
  end

  def find_max
    return @numbers.max
  end

  def find_min
    return @numbers.min
  end

  def average
    return @ave = @numbers.sum.to_f / @numbers.size
  end

  def mode
      count_hash = {}
      @numbers.each do |num|
        count_hash[num] = count_hash.fetch(num, 0) + 1  # เพิ่มการนับจำนวน
      end
      max_count = count_hash.values.max
      modes = count_hash.select { |key, value| value == max_count }.keys
      return modes
  end


  def even_numbers()
    anw =[]
    @numbers.each do |num|
      if num % 2 == 0
        anw.push(num)
      end
    end
    return anw
  end

  def count_vowels(sentence)
    return sentence.count("aeiou")
  end

  def factorial(number)
    i = number - 1
    while i > 1 do
      number *= i
      i -= 1
    end
    return number
  end
end
