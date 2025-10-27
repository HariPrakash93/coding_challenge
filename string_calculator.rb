def parse_delimiter(numbers)
  if numbers.start_with?("//")
    delimiter_line, numbers = numbers.split("\n", 2)
    delimiter = delimiter_line[2..-1]
    raise "Invalid delimiter" if delimiter.empty?
    [delimiter, numbers]
  else
    [",", numbers]
  end
end

def add(numbers)
  return 0 if numbers.empty?

  begin
    delimiter, numbers = parse_delimiter(numbers)
    numbers.gsub("\n", delimiter).split(delimiter).reject(&:empty?).map { |num| num.to_i }.sum
  rescue ArgumentError
    raise "Invalid input: numbers must be integers"
  rescue TypeError
    raise "Invalid delimiter format"
  end
end
