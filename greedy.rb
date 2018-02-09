class Greedy

  def self.seats(a)
    n = a.length
    first = 0
    last = n - 1
    for i in 0...n
      if a[i] == '.'
        a[i] = 'C'
      else
        first = i
        break
      end
    end

    for j in last.downto(0)
      if a[j] == '.'
        a[j] = 'C'
      else
        last = j
        break
      end
    end

    m = 0
    first.upto(last) do |i|
      if a[i+1] == '.'
        m += 1
        a[i] = 'C'
        a[i+1] = 'x'
      else
        first = i
        break
      end
    end
    p a
    p last
    p first
    last.downto(first) do |j|
      if a[j-1] == '.'
        m +=1
        a[j] = 'C'
        a[j-1] = 'x'
      else
        last = j
        break
      end
    end
    idx = a.index('.')
    min = [(last - idx).abs, (first - idx).abs].min if idx
    m += min if min
    m % 100000003
  end
end
