n = gets.chomp.to_i
input = gets.chomp.split.map(&:to_i)

res = 0
while (input = input.map { |i| i / 2 if i.even? }).compact.size == n
  res += 1
end

p res
