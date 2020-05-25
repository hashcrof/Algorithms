# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
    rows = matrix.length
    return [] if rows < 1
    cols = matrix[0].length
    return [] if cols < 1
    r = c = 0
    result = []

    dir = 0

    # dir = lft + top % 2
    # if dir == 0 ; going up diagonally, [i - 1, j + 1]
    # if dir == 1; going down diagonally; [i+1, j - 1]

    while r < rows and c < cols
        result << matrix[r][c]
        if dir == 0 # move col right
            #move [i - 1, j + 1] until c == cols - 1
            if c < cols - 1
                c += 1
                r -= 1
                r = r < 0 ? 0 : r
            else
                #move [i + 1, (cols - 1)] when c == cols - 1
                c = cols - 1
                r += 1
            end
        else #move down row
            #move [i+1, j - 1] until r == rows - 1
            if r < rows - 1
                r += 1
                c -= 1
                c = c < 0 ? 0 : c
            else
                #move [(rows - 1), j + 1] when r == rows - 1
                r = rows - 1
                c += 1
            end
        end

        dir = (r + c) % 2
    end
    result
end

puts find_diagonal_order([[1,2,3],[4,5,6],[7,8,9]]) == [1,2,4,7,5,3,6,8,9]
