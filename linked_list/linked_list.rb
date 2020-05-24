require_relative 'node'

module LinkedList
  class LinkedList
    attr_accessor :head, :tail

    def initialize(__head)
      @head = __head
    end

    #add as tail
    def append(node)
      #how do i get the tail? should i traverse the entire list to get to the end?
      #can i get this faster if i always keep track of the tail and update on append?
      temp = head
      while temp.next
        temp = temp.next
      end
      temp.next = node
    end

    #add as head
    def prepend(node)
      node.next, self.head = self.head, node
    end

    def insert(node, val)
    end

    def delete(node)
    end

    def length
      node = head
      len = 0
      while node
        len += 1
        node = node.next
      end
      len
    end
  end
end

node1 = LinkedList::Node.new(3)
node2 = LinkedList::Node.new(4)
node3 = LinkedList::Node.new(5)

node1.next = node2
node2.next = node3

l = LinkedList::LinkedList.new(node1)
puts l.length == 3

prepend_node = LinkedList::Node.new(2)
l.prepend(prepend_node)
puts l.length == 4

append_node = LinkedList::Node.new(6)
l.append(append_node)
puts l.length == 5
