start_range = 130254
end_range = 678275

range = start_range..end_range

sum = 0


range.each do |num|
  prev = nil
  has_adjacent = false
  only_decrease = true


  num.digits.each do |digit|
    if prev != nil && digit > prev
      only_decrease = false
      break
    elsif digit == prev
      has_adjacent = true
    end

    prev = digit
  end

  sum += 1 if has_adjacent && only_decrease
end

p sum