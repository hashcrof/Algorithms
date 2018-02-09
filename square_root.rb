class SquareRoot

  def self.binary_search(num)
    return num if num <= 1
    low = 0
    high = num/2
    while low < high do
      mid = (high + low)/2
      square = mid * mid
      if square == num
        return mid
      elsif square > num
        high = mid - 1
      else
        low = mid + 1
      end
    end
    low #return high for ceil(sqrt(x))
  end
end
