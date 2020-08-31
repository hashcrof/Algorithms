class Queue
  def initialize
    @q = []
    @elements = Hash.new{|h,k| h[k] = false }
    @size = 0
    @head = 0
  end


  def enqueue(v)
    @q << v
    @elements[v] = true
    @size += 1
  end

  def dequeue
    val = @q[@head]
    @elements.delete(@q[@head])
    @head += 1
    @size -= 1

    val
  end

  def size
    @size
  end

  def peek
    @q[@size - 1]
  end

  def contains(v)
    @elements[v]
  end
end


q = Queue.new

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

puts q.size == 3
puts q.peek

puts q.contains(4) == false
puts q.contains(1) == true

puts q.dequeue
puts q.contains(1) == false
puts q.size == 2
