class CircularQueue

=begin
    Initialize your data structure here. Set the size of the queue to be k.
    :type k: Integer
=end
    def initialize(k)
        @capacity = k
        @size = 0
        @head = @tail = 0
        @q = Array.new(k)
    end


=begin
    Insert an element into the circular queue. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
    def en_queue(value)
        return false if @size + 1 > @capacity
        @q[@tail] = value
        @tail = (@tail + 1) % @capacity
        @size += 1
        true
    end


=begin
    Delete an element from the circular queue. Return true if the operation is successful.
    :rtype: Boolean
=end
    def de_queue()
        return false if is_empty
        @head = (@head + 1) % @capacity
        @size -= 1
        true
    end


=begin
    Get the front item from the queue.
    :rtype: Integer
=end
    def front()
        return -1 if is_empty
        @q[@head]
    end


=begin
    Get the last item from the queue.
    :rtype: Integer
=end
    def rear()
        return -1 if is_empty
        @q[(@tail - 1) % @capacity]
    end


=begin
    Checks whether the circular queue is empty or not.
    :rtype: Boolean
=end
    def is_empty
        @size == 0
    end


=begin
    Checks whether the circular queue is full or not.
    :rtype: Boolean
=end
    def is_full
        @size == @capacity
    end
end
