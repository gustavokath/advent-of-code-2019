tree = {}

$stdin.each_line do |line|
  root, orbt = line.chomp.split(')')
  tree[root] = [] unless tree.key?(root)
  tree[orbt] = [] unless tree.key?(orbt)

  tree[root].push(orbt)
end


sum = 0
queue = []
queue = tree['COM']
level = 1

until queue.empty?
  sum += level * queue.size
  nexts = []

  queue.each do |node|
    nexts = nexts | tree[node]
  end
  queue = nexts
  level += 1
end

p sum