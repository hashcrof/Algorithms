class PowerFunction
  #Iterative O(logn)
  def self.binary_search(x, y) #x^y
    return 1 if y == 0
    return 0 if x == 0
    result = 1
    base = x
    while y > 0 do
      if y % 2 == 1 #odd x^3 = x*x^2
        result = result * base
      end
      base = base * base
      y = y >> 1 #rightshift by 1 bit 8>>1 = 4; like dividing by 2; odd y = (y - 1)/2 even y= y/2
    end
    result
  end

  def self.recursive(x, y)
    return 1 if y == 0
    return 0 if x == 0

    if y < 0
      y = y.abs
      x = 1.0/x
    end

    if y % 2 == 1
      y = y - 1
      result = x * recursive(x, y)
    else
      y = y / 2
      sq = recursive(x, y)
      result = sq * sq
    end
    result
  end
end
