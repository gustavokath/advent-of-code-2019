class Node
  attr_accessor :value, :childs, :parent

  def initialize(value, parent=nil)
    @value = value
    @childs = []
    @parent = parent
  end
end

def path(tree, value)
  return ['COM'] if value == 'COM'

  node = tree[value]
  return path(tree, node.parent).push(value)
end

tree = {}

$stdin.each_line do |line|
  root, orbt = line.chomp.split(')')

  tree[root] = Node.new(root) unless tree.key?(root)
  tree[orbt] = Node.new(orbt, root) unless tree.key?(orbt)

  tree[orbt].parent = root if tree[orbt].parent.nil?

  tree[root].childs.push(orbt)
end


you_path = path(tree, 'YOU')
santa_path = path(tree, 'SAN')

base = []

if you_path.size < santa_path.size
  base = you_path
else
  base = santa_path
end

last_index = 0
(0..base.size).each do |index|
  if you_path[index] != santa_path[index]
    last_index = index
    break
  end
end

p (you_path.size-last_index-1) + (santa_path.size-last_index-1)

