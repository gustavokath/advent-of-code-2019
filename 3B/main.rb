def delta_move(direction)
  case direction
  when 'R'
    [1,0]
  when 'L'
    [-1,0]
  when 'U'
    [0,1]
  when 'D'
    [0,-1]
  end
end

line1 = $stdin.readline.chomp.split(',')
line2 = $stdin.readline.chomp.split(',')


wire1_map = {}
wire2_map = {}
intersection = []
x = 0
y = 0
steps = 0

delta_x = 0
delta_y = 0

line1.each do |move|
  direction = move[0]
  distance = move[1,move.size].to_i

  delta_x, delta_y = delta_move(direction)

  distance.times do
    x += delta_x
    y += delta_y
    steps += 1

    wire1_map[[x,y]] = steps
  end
end

x,y = 0,0
steps = 0

line2.each do |move|
  direction = move[0]
  distance = move[1,move.size].to_i

  delta_x, delta_y = delta_move(direction)

  distance.times do
    x += delta_x
    y += delta_y
    steps += 1

    if wire1_map.key? [x,y]
      wire2_map[[x,y]] = steps
      intersection.push([x,y])
    end
  end
end

min = 1 << 64

intersection.each do |intersec|
  value = wire1_map[intersec] + wire2_map[intersec]
  min = value if value < min
end

p min

