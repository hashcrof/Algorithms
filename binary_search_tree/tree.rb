module BinarySearchTree
  class Tree
    attr_accessor :root

    def initialize
      @root = Node.new(0)
    end

    def insert(v)
      @root.insert(v)
    end

    def nodes
      root.children
    end
  end
end
