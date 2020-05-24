module LinkedList
  class Node
    attr_accessor :data, :next

    #TODO# create NullNode
    def initialize(val, __next=nil)
      @data = val
      @next = __next
    end
  end
end
