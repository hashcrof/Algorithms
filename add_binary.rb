# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    #reverse strings T: O(N)
    a = reverse_string(a)
    b = reverse_string(b)

    #convert strings to integers T: O(N)
    a_int = a_to_i(a)
    b_int = a_to_i(b)

    #sum of 2 integers
    sum = a_int + b_int
    #convert integer to binary
    sum.to_s(2)
end

def reverse_string(s)
    i = 0
    j = s.length - 1

    while i < j
        s[i], s[j] = s[j], s[i]
        i += 1
        j -= 1
    end
    s
end

def a_to_i(s)
    res = 0
    for i in (0...s.length)
        if s[i] == "1"
            res += 2 ** i
        end
    end
    res
end
