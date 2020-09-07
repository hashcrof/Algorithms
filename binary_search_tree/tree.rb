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

    def inorder(node=self.root, visited={})
      return unless node
      inorder(node.lft, visited)
      visited[node] = true
      inorder(node.rgt, visited)
    end

    def preorder(node=self.root, visited={})
      return unless node
      visited[node] = true
      preorder(node.lft, visited)
      preorder(node.rgt, visited)
    end

    def postorder(node=self.root, visited={})
      return unless node
      postorder(node.lft, visited)
      postorder(node.rgt, visited)
      visited[node] = true
    end
  end
end
