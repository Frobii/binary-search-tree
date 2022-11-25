class Node

    include Comparable

    attr_reader :data, :left, :right
    attr_writer :data, :left, :right
    
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
    end

end

class Tree
    attr_reader :array, :root
    attr_writer :array, :root

    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array = @root, start = 0, length = array.length - 1)

        if start > length
            return nil
        end
        
        mid = (start + length) / 2
        node = Node.new(array[mid])
        
        node.left = build_tree(array, start, mid -1)
        node.right = build_tree(array, mid + 1, length)

        return node
    end
    
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
      
end

array = [1,2,3,4,5,6,7]

tree1 = Tree.new(array)

tree1.pretty_print
