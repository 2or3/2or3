input = gets.chomp.split('').map(&:to_i)

res = 0
input.map { |i| res += i }

p res
