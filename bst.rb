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

    def insert(key, root = @root)

        if root == nil
            return Node.new(key)
        else
            if root.data == key
                return root
            elsif root.data < key
                root.right = insert(key, root.right)
            else
                root.left = insert(key, root.left)
            end
        end

        return root
    end

    def leftmostNode(node)
        current = node

        while current.left != nil
            current = current.left
        end

        return current
    end

    def delete(key, root = @root)
        if root.data.nil?
            return root
        end

        if key < root.data
            root.left = delete(key, root.left)
        elsif key > root.data
            root.right = delete(key, root.right)
        else
            if root.left.nil?
                temp = root.right
                root = nil
                return temp
            elsif root.right.nil?
                temp = root.left
                root = nil
                return temp
            end
            
            temp = leftmostNode(root.right)

            root.data = temp.data

            root.right = delete(temp.data, root.right)
        end

        return root

    end

    def find(key, root = @root)
        if root.data == key
            return root
        end

        if key < root.data
            root = find(key, root.left)
        elsif key > root.data
            root = find(key, root.right)
        end
    end

    def level_order(node = @root)
        output = []
        queue = [node]

        until queue.empty?
            current = queue.shift
            output.push(block_given? ? yield(current) : current.data)
            queue.push(current.left) if current.left
            queue.push(current.right) if current.right
        end

        output
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

tree1.insert(8)

tree1.pretty_print

tree1.delete(6)

tree1.pretty_print

p tree1.find(7)

p tree1.level_order 

tree1.level_order {|n| puts n.data}
