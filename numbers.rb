class Numbers

  def self.is_prime?(num)
    return false if num < 2

    is_prime = true
    for factor in 2..(num ** 0.5)
      if num % factor == 0
        is_prime = false
        break
      end
    end
    is_prime
  end

  def self.is_even?(num)
    return false if num == 0
    num & 1 == 0
  end

  def self.is_odd?(num)
    return false if num == 0
    !is_even?(num) #or num & 1 == 1
  end

  def self.all_factors(num)
    return [num] if num < 2
    factors = []
    for factor in 1..(num ** 0.5)
      if num % factor == 0
        factors << factor
        co_factor = num / factor
        factors << co_factor unless factor == co_factor
      end
    end
    factors.sort
  end
end
