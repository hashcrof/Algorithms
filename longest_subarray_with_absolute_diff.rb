Node = Struct.new(:val, :idx, :next, :prev)

class Deque
    def initialize
        @head = Node.new
        @tail = Node.new
        @head.next = @tail
        @tail.prev = @head
    end

    #shift
    def remove_from_head
        remove(head)
    end

    #pop
    def remove_from_tail
        remove(tail)
    end

    def insert_head(v, idx)
        n = Node.new(v, idx)
        _next = @head.next
        _next.prev = n
        n.next = _next
        n.prev = @head
        @head.next = n
    end

    def insert_tail(v, idx)
        n = Node.new(v, idx)
        _next = @tail
        prev = @tail.prev
        @tail.prev = n
        prev.next = n
        n.prev = prev
        n.next = @tail
    end

    def head
        @head.next
    end

    def tail
        @tail.prev
    end

    def remove(node)
        prev = node.prev
        _next = node.next
        prev.next = _next
        _next.prev = prev
        node.prev = nil
        node.next = nil
        node
    end
end


# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
def longest_subarray(nums, limit)
    n = nums.length

    return 1 if n == 1

    min = Deque.new #min val is at head
    max = Deque.new #max val is at head

    min.insert_head(nums[0], 0)
    max.insert_head(nums[0], 0)

    lft = 0
    rgt = 0
    ans = 0

    while rgt < n
        min.remove_from_tail while min.tail.val && min.tail.val  > nums[rgt]
        min.insert_tail(nums[rgt], rgt)
        max.remove_from_tail while max.tail.val && max.tail.val < nums[rgt]
        max.insert_tail(nums[rgt], rgt)

        if (max.head.val - min.head.val).abs <= limit
            len = rgt - lft + 1
            ans = [ans, len].max
            rgt += 1
        else
            max.remove_from_head while max.head.idx <= lft
            min.remove_from_head while min.head.idx <= lft
            lft += 1
        end
    end
    ans
end
