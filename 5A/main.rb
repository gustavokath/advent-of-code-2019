def get_value(values, type, pos)
  return pos if type == 1
  return values[pos]
end

def sum(values, param_types, pointer)
  value1 = get_value(values, param_types % 10, values[pointer+1])
  param_types /= 10
  value2 = get_value(values, param_types % 10, values[pointer+2])

  values[values[pointer+3]] = value1 + value2
end

def multiply(values, param_types, pointer)
  value1 = get_value(values, param_types % 10, values[pointer+1])
  param_types /= 10
  value2 = get_value(values, param_types % 10, values[pointer+2])

  values[values[pointer+3]] = value1 * value2
end

def input(values, dest_pos)
  values[dest_pos] = 1
end

def output(values, type, value)
  if type == 0
    p values[value]
  else
    p value
  end
end


values = $stdin.readline.chomp.split(',').map(&:to_i)

pointer = 0
operation = values[pointer] % 100

params_types = values[pointer] / 100

until operation == 99
  if operation == 1
    sum(values, params_types, pointer)
    pointer += 3
  elsif operation == 2
    multiply(values, params_types, pointer)
    pointer += 3
  elsif operation == 3
    input(values, values[pointer+1])
    pointer += 1
  elsif operation == 4
    output(values, params_types % 10, values[pointer+1])
    pointer += 1
  else
    puts "Invalid operation #{operation}"
  end
  pointer += 1

  operation = values[pointer] % 100
  params_types = values[pointer] / 100
end


