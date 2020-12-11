i = gets.chomp.split(' ').map(&:to_i)

if (i[0] * i[1]).even?
  print('Even')
else
  print('Odd')
end
