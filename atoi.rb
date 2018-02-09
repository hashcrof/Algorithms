class Atoi

  def self.to_i(str)
    return unless str.is_a? String
    minus = str[0] == '-'
    str = str[1..-1] if minus
    result = 0
    str.each_char do |c|
      result = result*10 + (c.ord - '0'.ord) # or c.ord % 16
    end
    return -result if minus
    result
  end
end
