# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25
#
# Data from square 1 is carried 0 steps, since it's at the access port.
# Data from square 12 is carried 3 steps, such as: down, left, left.
# Data from square 23 is carried only 2 steps: up twice.
# Data from square 1024 must be carried 31 steps.

# input = 347991
# input = 1024
input = 347991
inputPos = {}

count = 1
maxSq = 0

while maxSq < input
  maxSq = count * count
  count += 2
end
count -= 2
mid = count / 2

lastCountOfPrev = (count-2) * (count-2)
extraNums = maxSq - lastCountOfPrev

puts "input : #{input}"
puts "mid : #{mid}"
puts "maxSq : #{maxSq}"
puts "extraNums : #{extraNums}"
puts "lastCountOfPrev : #{lastCountOfPrev}"
puts "count : #{count}"
puts ""

corners = []
corners << lastCountOfPrev + count-1
corners << corners.last + count-1
corners << corners.last + count-1
corners << corners.last + count-1

puts corners.inspect

if input >= corners[-2]
  inputPos[:y] = -mid
  inputPos[:x] = input - (corners[-2] + mid)
elsif input >= corners[-3]
  inputPos[:x] = -mid
  inputPos[:y] = -(input - (corners[-3] + mid))
elsif input >= corners[-4]
  inputPos[:y] = mid
  inputPos[:x] = -(input - (corners[-4] + mid))
else
  inputPos[:x] = mid
  inputPos[:y] = input - (corners[0] - mid)
end

puts inputPos.inspect
dist = (0-inputPos[:x]).abs + (0-inputPos[:y]).abs
puts dist