n = gets.chomp.to_i
a = gets.chomp.split('')
b = gets.chomp.split('')
c = gets.chomp.split('')

res = 0
[*0..n - 1].each do |i|
  count = [b[i], c[i], a[i]].uniq.length
  if count == 3
    res += 2
  elsif count == 2
    res += 1
  end
end

print res
