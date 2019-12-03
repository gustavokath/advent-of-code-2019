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
intersection = []
x = 0
y = 0

delta_x = 0
delta_y = 0

line1.each do |move|
  direction = move[0]
  distance = move[1,move.size].to_i

  delta_x, delta_y = delta_move(direction)

  distance.times do
    x += delta_x
    y += delta_y
    wire1_map[[x,y]] = true
  end
end

x,y = 0,0

line2.each do |move|
  direction = move[0]
  distance = move[1,move.size].to_i

  delta_x, delta_y = delta_move(direction)

  distance.times do
    x += delta_x
    y += delta_y

    if wire1_map.key? [x,y]
      intersection.push([x,y])
    end
  end
end

min = 1 << 64

intersection.each do |item|
  value = item[0].abs + item[1].abs
  min = value if value < min
end

p min

