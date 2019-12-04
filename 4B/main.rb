start_range = 130254
end_range = 678275

range = start_range..end_range

sum = 0


range.each do |num|
  prev = nil

  count_set = {}
  only_decrease = true

  num.digits.each do |digit|
    if prev != nil && digit > prev
      only_decrease = false
      break
    end

    count_set[digit] = 0 unless count_set.key?(digit)

    count_set[digit] = count_set[digit] + 1

    prev = digit
  end

  sum += 1 if only_decrease && count_set.value?(2)
end

p sum