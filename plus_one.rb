#Given a non-negative number represented as an array of digits,
#add 1 to the number ( increment the number represented by the digits ).
#The digits are stored such that the most significant digit is at the head of the list.
# eg: [1, 2, 3] returns [1, 2, 4] since 123 + 1 = 124
class PlusOne
  def self.add_one(a)
    # result = []
    # carry = 1
    # len = a.size
    # for i in (len-1).downto(0)
    #   a[i] += 1
    #   carry = 0
    #   if a[i] % 10 == 0
    #     carry = 1
    #     a[i] = 0
    #   else
    #     break
    #   end
    # end
    #
    # if carry == 1 and a[0] == 0
    #   result << carry
    # end
    # result += a

    n = a.length - 1
    carry = 1
    result = []

    n.downto(0) do |i|
      plus_one = a[i] + carry
      carry = plus_one / 10
      a[i] = plus_one % 10
      break unless carry > 0
    end

    if carry > 0
        result << carry
    end
    result += a
  end
end
