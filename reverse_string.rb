class ReverseString
  def self.in_place(str)
    len = str.length
    low = 0
    high = len - 1
    while low < high do
      str[low], str[high] = str[high], str[low]
      low += 1
      high -=1
    end
    str
  end
end
