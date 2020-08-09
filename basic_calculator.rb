# @param {String} s
# @return {Integer}
def calculate(s)
    s = s.gsub(/\s/, '')
    operand_queue = []
    operator_stack = []

    len = s.length
    i =  0

    while i < len
        c = s[i]
        if is_digit(c)
            num = to_digit(c)
            i += 1

            while i < len && is_digit(s[i])
                num = (10 * num) + to_digit(s[i])
                i += 1
            end
            operand_queue << num
        elsif c == '('
            operator_stack << c
            i += 1
        elsif c == ')'
            while operator_stack[-1] != '('
                n2 = operand_queue.pop
                n1 = operand_queue.pop
                op = operator_stack.pop
                operand_queue << operate(n1, n2, op)
            end
            operator_stack.pop
            i += 1
        else
            #while current operator has equal or lesser precendence than previous
            while(operator_stack.length > 0 && precedence(c, operator_stack[-1]) <= 0)
                n2 = operand_queue.pop
                n1 = operand_queue.pop
                op = operator_stack.pop
                operand_queue << operate(n1, n2, op)
            end
            operator_stack << c
            i += 1
        end
    end

    while operator_stack.length > 0
        n2 = operand_queue.pop()
        n1 = operand_queue.pop()
        op = operator_stack.pop
        operand_queue << operate(n1, n2, op)
    end
    operand_queue.pop
end


def precedence(curr, prev)
    map = {
        ?( => -1,
        ?+ => 0,
        ?- => 0,
        ?* => 1,
        ?/ => 1,
        ?^ => -1
    }

    map[curr] - map[prev]
end

def operate(n1, n2, op)
    map = {
        ?+ => -> (a, b) { a + b },
        ?- => -> (a, b) { a - b },
        ?* => -> (a, b) { a * b },
        ?/ => -> (a, b) {
            if a/b < 0 && !(a % b).zero?
                (a/b).ceil #ceiling
            else
                 a/b #floor
            end
        },
        ?^ => -> (a, b) { a ** b }
    }

    map[op]&.call(n1, n2) || 0
end

def is_digit(c)
    to_digit(c) >= 0
end

def to_digit(c)
    c.ord - '0'.ord
end


puts calculate("3 + 4 * 2 /(1 - 5)") == 1
puts calculate("42") == 42
