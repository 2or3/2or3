gets
cards = gets.chomp.split.map(&:to_i)

count = 1
a = 0
b = 0
cards.sort.reverse.each do |num|
    if count.odd?
        a += num
    else
        b += num
    end
    count += 1
end

p a - b
gets
cards = gets.chomp.split.map(&:to_i)

count = 1
a = 0
b = 0
cards.sort.reverse.each do |num|
  if count.odd?
    a += num
  else
    b += num
  end
  count += 1
end

p a - b
