sum = 0
$stdin.each_line do |line|
    value = line.chomp.to_i
    value = (value / 3) - 2
    sum += value
end
p sum