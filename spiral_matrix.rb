class SpiralMatrix
  # param a : array of array of integers
  # return a array of integers
  def spiralOrder(a)
    top = 0
    bottom = a.size - 1
    lft = 0
    rgt = a[0].size - 1
    dir = 0

    while top <= bottom and lft <= rgt
      if dir == 0
        lft.upto(rgt) do |i|
          p a[top][i]
        end
        top += 1
        dir += 1
      elsif dir == 1
        top.upto(bottom) do |i|
          p a[i][rgt]
        end
        rgt -= 1
        dir += 1
      elsif dir == 2
        rgt.downto(lft) do |i|
          p a[bottom][i]
        end
        bottom -= 1
        dir += 1
      elsif dir == 3
        bottom.downto(top) do |i|
          p a[i][lft]
        end
        lft += 1
        dir += 1
      end
      dir = dir % 4
    end
  end

  def generateMatrix(a)
    matrix = Array.new(a){Array.new(a)}
    top = 0
    bottom = a - 1
    lft = 0
    rgt = a - 1
    dir = 0
    i = 1

    while top <= bottom and lft <= rgt and i <= a**2 do
      if dir == 0
        for j in lft.upto rgt
          matrix[top][j] = i
          i+=1
        end
        top += 1
        dir += 1
      elsif dir == 1
        for j in top.upto bottom
          matrix[j][rgt] = i
          i+=1
        end
        rgt -=1
        dir += 1
      elsif dir == 2
        for j in rgt.downto(lft)
          matrix[bottom][j] = i
          i+=1
        end
        bottom -= 1
        dir +=1
      elsif dir == 3
        for j in bottom.downto(top)
          matrix[j][lft] = i
          i+=1
        end
        lft += 1
        dir += 1
      end
      dir = dir % 4
    end
    matrix
  end

  def prettyPrint(a)
    n = (2*a) - 1
    matrix = Array.new(n){ Array.new(n)}
    top = 0
    bottom = n -1
    lft = 0
    rgt = n - 1
    dir = 0
    i = a

    while top <= bottom and lft <= rgt do
      if dir == 0
        for j in lft.upto(rgt)
          matrix[top][j] = i
        end
        top += 1
        dir += 1
      elsif dir == 1
        for j in top.upto(bottom)
          matrix[j][rgt] = i
        end
        rgt -= 1
        dir += 1
      elsif dir == 2
        for j in rgt.downto(lft)
          matrix[bottom][j] = i
        end
        bottom -= 1
        dir += 1
      elsif dir == 3
        for j in bottom.downto(top)
          matrix[j][lft] = i
        end
        lft += 1
        dir += 1
      end

      dir = dir % 4
      i -= 1 if dir == 0
    end
    return matrix
  end
end
