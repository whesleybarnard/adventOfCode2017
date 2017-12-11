# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25

# 147  142  133  122   59
# 304    5    4    2   57
# 330   10    1    1   54
# 351   11   23   25   26
# 362  747  806--->   ...

def printGrid(arr)
  arr.each do |a|
    puts a.inspect
  end
end

def calcVal(arr, currentY, currentX)
  # puts "currentY: #{currentY}, currentX: #{currentX}"

  sum = 0
  # get all 9 borders
  sum += (arr[currentY - 1][currentX]) || 0 #top
  sum += (arr[currentY - 1][currentX - 1]) || 0 #top-left
  sum += (arr[currentY - 1][currentX + 1]) || 0 #top-right

  sum += (arr[currentY][currentX - 1]) || 0 #left
  sum += (arr[currentY][currentX + 1]) || 0 #right

  sum += (arr[currentY + 1][currentX]) || 0 #bottom
  sum += (arr[currentY + 1][currentX - 1]) || 0 #bottom-left
  sum += (arr[currentY + 1][currentX + 1]) || 0 #bottom-right

  # puts sum
  arr[currentY][currentX] = sum
  sum
end

input = 347991
# input = 13
sqNum = 1

while true
  if sqNum * sqNum >= input
    sqNum += 2
    break
  end
  sqNum += 2
end

# sqNum = 3
# puts sqNum

# puts "sqNum: #{sqNum}"
mid = sqNum / 2
# puts "mid: #{mid}"

empty_table = Array.new(sqNum) {Array.new(sqNum)}

currentX = mid
currentY = mid

empty_table[currentY][currentX] = 1
# puts empty_table[currentY][currentX]

# printGrid empty_table
# puts '----------------------------'

sqLoopNum = 3
lastVal = 0

while true
  # puts j

  currentX = currentX += 1
  currentY = currentY += 1

  # puts "sqLoopNum: #{sqLoopNum}"
  # puts 'doing right-up'
  for i in 1..sqLoopNum - 1
    currentY = currentY -= 1
    lastVal = calcVal empty_table, currentY, currentX
    if lastVal > input
      puts "next biggest num: #{lastVal}"
      return
    end
  end

  # puts 'doing top-left'
  for i in 1..sqLoopNum - 1
    currentX = currentX -= 1
    lastVal = calcVal empty_table, currentY, currentX
    if lastVal > input
      puts "next biggest num: #{lastVal}"
      return
    end
  end

  # puts 'doing right-down'
  for i in 1..sqLoopNum - 1
    currentY = currentY += 1
    lastVal = calcVal empty_table, currentY, currentX
    if lastVal > input
      puts "next biggest num: #{lastVal}"
      return
    end
  end

  # puts 'doing bottom-right'
  for i in 1..sqLoopNum - 1
    currentX = currentX += 1
    lastVal = calcVal empty_table, currentY, currentX
    if lastVal > input
      puts "next biggest num: #{lastVal}"
      return
    end
  end

  # printGrid empty_table
  sqLoopNum = sqLoopNum += 2
end

# printGrid empty_table