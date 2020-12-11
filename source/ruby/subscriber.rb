n, a, b = gets.chomp.split.map(&:to_i)

min = a < b ? a : b

res = []
[*0..min].each do |i|
    res.push(i) if a + b - i <= n
end

print res.max, ' ', res.min
