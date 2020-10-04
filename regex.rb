'''
.*.*.*
IF THERES AN *
if pattern[0] == text[0] OR pattern[0] == '.':
a*b   ->   a*b
aab   ->   ab

.*b   ->   .*b
aab   ->   ab

012        2   pattern[2:]
a*a   ->   a   (move pattern index 2 to the right)
a     ->   a    -> TRUE

false or true -> true

else:
012        2   pattern[2:]
a*b   ->   b
b     ->   b
'''

def is_match(text, pattern)
  # your code goes here

  # text and pattern don't match

  len_p = pattern.length
  return false if len_p == 0

  len_t = text.length
  i = 0
  j = 0

  while i < len_t && j < len_p
    p = pattern[j]
    c = text[i]
    if pattern[j+1] == '*'
      if pattern[j] == text[i] || pattern[j] == '.'

      else
        j += 2
      end
    elsif p == '.'
      i += 1
      j += 1
    else
      if p == c
        i += 1
        j += 1
      else
        return false
      end
    end
  end

  if i < len_t
    return false
  else
    return true
  end
end
