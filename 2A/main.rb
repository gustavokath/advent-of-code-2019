def sum(values, pos1, pos2, dest_pos)
  values[dest_pos] = values[pos1] + values[pos2]
end

def multiply(values, pos1, pos2, dest_pos)
  values[dest_pos] = values[pos1] * values[pos2]
end

values = $stdin.readline.chomp.split(',').map(&:to_i)

## Required operations
values[1] = 12
values[2] = 2

pointer = 0
operation = values[pointer]

until operation == 99
  if operation == 1
    sum(values, values[pointer+1], values[pointer+2], values[pointer+3])
  elsif operation == 2
    multiply(values, values[pointer+1], values[pointer+2], values[pointer+3])
  else
    puts "Invalid operation #{operation}"
  end
  pointer += 4
  operation = values[pointer]
end

p values.first


