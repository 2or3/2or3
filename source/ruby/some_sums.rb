n, a, b = gets.chomp.split.map(&:to_i)

count = 0
[*1..n].each do |input|
    sum = 0
    input.to_s.split('').each { |i| sum += i.to_i }

    count += input if (sum >= a) && (sum <= b)
end

p count
