class Node
  attr_accessor :value, :left, :right

  def initialize(value:, left: nil, right: nil)
    self.value = value
    self.left = left
    self.right = right
  end

  def to_s
    value.to_s
  end
end

def serialize(node)
  queue = [node]
  string = ''

  loop do
    break if queue.size <= 0
    current = queue.shift

    if current.nil?
      string += 'null,'
      next
    end

    queue << current.left
    queue << current.right
    string += "#{current.value},"
  end

  string
end


def deserialize(string)
  string_queue = string.split(',')
  tree = Node.new(value: string_queue.shift)
  queue = []
  queue << tree

  loop do
    break if queue.size <= 0

    current = queue.shift

    left = string_queue.shift
    right = string_queue.shift

    left_node = left == 'null' ? nil : Node.new(value: left)
    queue << left_node unless left_node.nil?

    right_node = right == 'null' ? nil : Node.new(value: right)
    queue << right_node unless right_node.nil?

    current.left = left_node
    current.right = right_node
  end

  tree
end

# CASE 1
d_node = Node.new(value: 'left.left')
c_node = Node.new(value: 'right')
b_node = Node.new(value: 'left', left: d_node)
a_node = Node.new(value: 'root', left: b_node, right: c_node)

new_tree = deserialize(serialize(a_node))
puts new_tree.left.left.value == 'left.left'

# CASE 2
g_node = Node.new(value: 'G')
f_node = Node.new(value: 'F')
e_node = Node.new(value: 'E', left: g_node)
d_node = Node.new(value: 'D', left: f_node)
c_node = Node.new(value: 'C', left: e_node)
b_node = Node.new(value: 'B', left: d_node)
a_node = Node.new(value: 'A', left: b_node, right: c_node)

new_tree = deserialize(serialize(a_node))
puts new_tree.right.left.value == 'E'
puts new_tree.right.left.left.value == 'G'
