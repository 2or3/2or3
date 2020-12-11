a = gets.to_i

b, c = gets.chomp.split(' ').map(&:to_i)

s = gets.to_s

print((a + b + c).to_s + ' ' + s + "\n")
