class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_delimiter(numbers)
    num_list = numbers.gsub("\n", delimiter).split(delimiter).reject(&:empty?).map { |num| num.to_i }
    validate_numbers(num_list)
    num_list.sum
  rescue RuntimeError => e
    raise e if e.message.start_with?("negative numbers") || e.message.start_with?("Invalid delimiter")
    raise "Invalid input: numbers must be integers"
  end

  private_class_method def self.parse_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      raise "Invalid delimiter" if delimiter.empty?
      [delimiter, numbers]
    else
      [",", numbers]
    end
  end

  private_class_method def self.validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
    numbers
  end
end

def add(numbers)
  StringCalculator.add(numbers)
end
