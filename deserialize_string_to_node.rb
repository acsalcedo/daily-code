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

    string += "#{current&.value},"
    next if current.nil?

    queue += [current.left, current.right]
  end

  string
end


def deserialize(string)
  string_queue = string.split(',', -1)
  tree = Node.new(value: string_queue.shift)
  queue = []
  queue << tree

  loop do
    break if queue.size <= 0

    current = queue.shift

    left = string_queue.shift
    right = string_queue.shift

    current.left = create_node(left, queue)
    current.right = create_node(right, queue)
  end

  tree
end

def create_node(node_value, queue)
  new_node = node_value.empty? ? nil : Node.new(value: node_value)
  queue << new_node unless new_node.nil?
  new_node
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
