module BinarySearchTree
  class NullNode
    attr_accessor :parent, :val, :lft, :rgt
    def <=>(*)
      0
    end

    def insert(*)
      false
    end

    def null_node?
      true
    end
  end
end
