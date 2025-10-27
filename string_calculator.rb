def add(numbers)
  return 0 if numbers.empty?
  begin
    numbers.split(",").map { |num| num.to_i }.sum
  rescue ArgumentError
    raise "Invalid input: numbers must be integers"
  end
end
