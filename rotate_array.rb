#Given an n x n 2D matrix, rotate it by 90deg
class RotateArray

  def self.rotate(a)
    transpose(a)
    reverse(a)
  end

  def self.transpose(a)
    rows = a.size
    cols = a[0].size
    for c in 0...cols
      for r in (c+1)...rows
        a[r][c], a[c][r] = a[c][r], a[r][c]
      end
    end
    a
  end

  def self.reverse(a)
    a.each do |row|
      len = row.size
      fst = 0
      lst = len - 1
      while fst < lst do
        row[fst], row[lst] = row[lst], row[fst]
        fst += 1
        lst -= 1
      end
    end
    a
  end
end
