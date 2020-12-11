a500 = gets.chomp.to_i
b100 = gets.chomp.to_i
c50 = gets.chomp.to_i
x = gets.chomp.to_i

count = 0
(0..a500).each do |a|
  (0..b100).each do |b|
    (0..c50).each do |c|
      count += 1 if (a * 500) + (b * 100) + (c * 50) == x
    end
  end
end

p count
