def get_value(values, type, pos)
  return pos if type == 1
  return values[pos]
end

def get_values(values, param_types, pointer)
  value1 = get_value(values, param_types % 10, values[pointer+1])
  param_types /= 10
  value2 = get_value(values, param_types % 10, values[pointer+2])
  return value1, value2
end

def sum(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  values[values[pointer+3]] = value1 + value2
end

def multiply(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  values[values[pointer+3]] = value1 * value2
end

def input(values, value, dest_pos)
  values[dest_pos] = value
end

def output(values, type, value)
  if type == 0
    return values[value]
  else
    return value
  end
end

def jump_if_true(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  return value2 if value1 != 0
  return pointer+3 #Standard Jump
end

def jump_if_false(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  return value2 if value1 == 0
  return pointer+3 #Standard Jump
end

def less_than(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  if value1 < value2
    values[values[pointer+3]] = 1
  else
    values[values[pointer+3]] = 0
  end
end

def equals(values, param_types, pointer)
  value1, value2 = get_values(values, param_types, pointer)

  if value1 == value2
    values[values[pointer+3]] = 1
  else
    values[values[pointer+3]] = 0
  end
end

def intcode_progam(values, setting, input)
  pointer = 0
  operation = values[pointer] % 100

  param_types = values[pointer] / 100
  output = 0
  setting_read = false

  until operation == 99
    case operation
    when 1
      sum(values, param_types, pointer)
      pointer += 4
    when 2
      multiply(values, param_types, pointer)
      pointer += 4
    when 3
      if setting_read
        input(values, input, values[pointer+1])
      else
        input(values, setting, values[pointer+1])
        setting_read = true
      end
      pointer += 2
    when 4
      output = output(values, param_types % 10, values[pointer+1])
      pointer += 2
    when 5
      pointer = jump_if_true(values, param_types, pointer)
    when 6
      pointer = jump_if_false(values, param_types, pointer)
    when 7
      less_than(values, param_types, pointer)
      pointer += 4
    when 8
      equals(values, param_types, pointer)
      pointer += 4
    else
      puts "Invalid operation #{operation}"
    end

    operation = values[pointer] % 100
    param_types = values[pointer] / 100
  end
  return output
end



values = $stdin.readline.chomp.split(',').map(&:to_i)

max = 0

[0,1,2,3,4].permutation.each do |sequence|
  result = 0
  sequence.each do |num|
    result = intcode_progam(values.dup, num, result)
  end
  max = result if result > max
end

p max




