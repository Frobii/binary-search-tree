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

end
