Class Node

    include Comparable

    attr_reader :data, :left, :right
    attr_writer :data, :left, :right
    
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
    end

end

Class Tree

    def initialize(array)
        @input = array
        @root = nil
    end

    def build_tree(array, start = 0, length)
        length = array.length

        if start > length
            return null
        end

        mid = (start + length) / 2
        root = Node.new(array[mid])

        root.left = build_tree(array, start, mid -1)
        root.right = build_tree(array, mid + 1, length)

        return root
    end

end

array = [1,2,3]

