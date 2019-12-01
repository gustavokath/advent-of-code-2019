sum = 0
$stdin.each_line do |line|
    value = line.chomp.to_i
    while value > 0
        value = (value / 3) - 2
        sum += value if value > 0 
    end
end
p sum