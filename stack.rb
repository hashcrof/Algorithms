class Stack

  def initialize
    @stack = []
    @size = 0
    @elements = Hash.new{|h,k| h[k] = 0}
  end

  def push(v)
    @elements[v] += 1
    @stack << v
    @size += 1
  end

  def pop
    @elements[@stack[-1]] -= 1
    @stack.pop
    @size -= 1
  end

  def peek
    @stack[-1]
  end

  def size
    @size
  end

  def contains(v)
    @elements[v] > 0
  end
end
