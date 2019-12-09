width = 25
height = 6

pixels = $stdin.readline.chomp.split('').map(&:to_i)

image = []
line = -1
num_line = 0
min_zeros = 25
zeros_line = 0

pixels.each_with_index do |pixel, index|
  if index % 25 == 0
    

    line += 1
    image[line] = []
  end



end

p max




