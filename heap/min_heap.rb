class MinHeap
  def initialize()
    @heap = [nil]
    @size = 0
  end

  def add(v)
    @heap << v
    @size += 1

    if @size > 0
      swim(parent(@size), @size)
    end
  end

  def peek
    @heap[1]
  end

  #remove top
  def poll
    return unless @size > 0
    swap(1, @size)
    v = @heap.pop
    sink(1, child_index(1))
    @size -= 1
    v
  end

  def size
    @size
  end

  private

  def swap(idx1, idx2)
    @heap[idx1], @heap[idx2] = @heap[idx2], @heap[idx1]
  end

  #heapifyDown
  def sink(p_idx, c_idx)
    while @heap[p_idx] && @heap[c_idx] && @heap[c_idx] < @heap[p_idx]
      swap(c_idx, p_idx)
      p_idx = c_idx
      c_idx = child_index(p_idx)
    end
  end

  #heapifyUp
  def swim(p_idx, c_idx)
    while @heap[p_idx] && @heap[c_idx] && @heap[p_idx] > @heap[c_idx]
      swap(p_idx, c_idx)
      c_idx = p_idx
      p_idx = parent(c_idx)
    end
  end

  def parent(idx)
    (idx/2).floor
  end

  def left_child(idx)
    idx * 2
  end

  def right_child(idx)
    idx * 2 + 1
  end

  def child_index(idx)
    lft = left_child(idx)
    rgt = right_child(idx)
    return lft unless @heap[lft] && @heap[rgt]
    (@heap[lft] <= @heap[rgt]) ? lft : rgt
  end
end

pq = MinHeap.new

pq.add(3)
pq.add(1)
pq.add(2)
puts pq.size
puts pq.inspect

pq.add(0)
puts pq.inspect

pq.poll
puts pq.inspect
pq.poll
puts pq.inspect
