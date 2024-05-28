def add(str)
    delimeter = str[%r{//(\[.*?\])\n}] ? $1.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.quote(d) }.join('|') : ','
    new_str = str.split(/#{delimeter}|\n/).map(&:to_i)
    raise ArgumentError, "Negative values Not Allowed: #{new_str.select { |n| n < 0 }.join(',') }" if new_str.find { |n| n < 0 }
    new_str.reject { |n| n > 1000 }.reduce(0, :+)
end