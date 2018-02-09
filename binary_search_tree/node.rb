module BinarySearchTree
  class Node
    #edm_entity
    #left_val, right_val
    attr_reader :val
    attr_accessor :lft, :rgt, :parent


    def initialize(_val)
      @val = _val
      @lft = NullNode.new
      @rgt = NullNode.new

      self.lft.parent = self
      self.rgt.parent = self
    end

    def insert(v)
      case val <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then false
      end
    end

    def null_node?
      false
    end

    def root?
      self.parent.nil?
    end

    def children
      [self.lft, self.rgt]
    end

    private

    def insert_right(v)
      self.rgt.insert(v) or self.rgt = Node.new(v)
      self.rgt.parent = self
    end

    def insert_left(v)
      self.lft.insert(v) or self.lft = Node.new(v)
      self.lft.parent = self
    end
  end
end
