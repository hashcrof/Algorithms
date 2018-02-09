class Fibonacci
  #get the first n Fibonacci numbers which is actually F0 to F(n-1)
  #eg: First 2 numbers if F0 and F1 [0, 1]

  def self.iterative(n)
    return n if n <= 1
    a = 0
    b = 1
    n.times do
      a, b = b, a #swap; a is now Fib(n-1) and b is Fib(n-2)
      b = a + b
    end
    a #F(n-1)
  end

  def self.iterative_memo(n)
    return n if n <= 1
    cache = {}
    (n+1).times do |i| #run it n+1 times because n.times is 0...n
      if i <= 1
        cache[i] = i
      else
        cache[i] = cache[i-1] + cache[i-2]
      end
    end
    cache[n]
  end
end
