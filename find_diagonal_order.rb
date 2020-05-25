# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
    result = []
    rows, cols = matrix.length, matrix[0]&.length
    return result if rows < 1 || cols < 1
    dir = r = c = 0
    # 2 directions
    # dir = 0; going up diagonally;
    # dir = 1; going down diagonally;
    # dir = (r + c) % 2

    # when dir = 0
    # there are 2 possible movements: [r - 1, c + 1] or [r + 1, cols - 1]
    # r = r - 1; c = c + 1 if c < cols - 1
    # r = r + 1 if c >= cols - 1


    # when dir = 1
    # there are 2 possible movements: [r + 1, c - 1] or [rows - 1, c + 1]
    # r = r + 1; c = c - 1 if r < rows - 1
    # c = c + 1 if r >= rows - 1

    # r = r < 0 ? 0 : r
    # c = c < 0 ? 0 : r

    while r < rows and c < cols
        result << matrix[r][c]

        if dir == 0
            if c < cols - 1
                r -= 1
                c += 1
            else
                r += 1
            end
            r = r < 0 ? 0 : r
        else
            if r < rows - 1
                r += 1
                c -= 1
            else
                c += 1
            end
            c = c < 0 ? 0 : c
        end

        dir = (r + c) % 2
    end
    result
end

puts find_diagonal_order([[1,2,3],[4,5,6],[7,8,9]]) == [1,2,4,7,5,3,6,8,9]

=begin
Mistakes

1. Tried to have 4 pointers; top/bottom and lft/rgt
2. Did not account for second possible movement when row and column are at the matrix end
=end
