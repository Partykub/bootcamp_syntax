class BrokenFunctions
   def odd_even(n)
    if n % 2 == 0
       puts "Even number.\n"
    else
       puts "Odd number.\n"
    end
   end

   def is_prime(p)
    if p <= 1
       return false
    elsif p <= 3
       return true
    elsif p == 4
      return false
    elsif p % 2 == 0 && p % 3 == 0
       return false
    end

    k = 5
   while k <=  Math.sqrt(p)
      if p % k == 0
         return false
      end

      k+=1
   end
   return true
   end

   def find_longest_and_shortest_words(words)

      longest_word = words[0]
      shortest_word = words[0]

      words.each do |word|
       if word.length > longest_word.length
            longest_word = word
       end
       if word.length < shortest_word.length
            shortest_word = word
       end

      end

      return [shortest_word, longest_word]
   end
end

