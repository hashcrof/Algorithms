=begin
Given a math expression in infix notation, generate the postfix notation

The expression string contains only non-negative integers, +, -, *, / operators and empty spaces .
=end

###Shunting-Yard Algorithm
def postfix(s)
  s = s.gsub(/\s/, '')
  len = s.length
  return 0 if len < 1

  queue = []
  op_stack = []
  i = operand = res = 0

  while i < len
      c = s[i]

      if is_digit?(c)
          queue <<  c
      else
          if c == '*' || c == '/' #higher precedence
              if op_stack[-1] == '*' || op_stack[-1] == '/'
                  queue << op_stack.pop
              end
          end
          op_stack << c
      end
      i += 1
  end

  (queue + op_stack.reverse).join
end

def is_digit?(c)
    to_digit(c) >= 0
end

def to_digit(c)
    c.ord - '0'.ord
end

puts postfix("3+2*2") == '322*+'
puts postfix('3+4*5/6') == '345*6/+'
