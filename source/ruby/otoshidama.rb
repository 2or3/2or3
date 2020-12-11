n, yen = gets.chomp.split(" ").map(&:to_i)

x = yen / 10000
y = (yen % 10000) / 5000
z = ((yen % 10000) % 5000) / 1000

diff = n - (x + y + z)

while true do
  if x < 0 or y < 0 or z < 0 then
    x = -1
    y = -1
    z = -1
    break
  elsif diff >= 9 and x > 0 then
    x -= 1
    z += 10
  elsif diff >= 4 and y > 0 then
    y -= 1
    z += 5
  elsif diff >= 1 and x > 0 then
    x -= 1
    y += 2
  elsif diff == 0 then
    break
  else
    x = -1
    y = -1
    z = -1
    break
  end

  diff = n - (x + y + z)
end

print("#{x} #{y} #{z}")
