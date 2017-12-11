# s = '4,1,15,12,0,9,9,5,5,8,7,3,14,5,12,3'
s = '0,14,13,12,11,10,8,8,6,6,5,3,3,2,1,10'
# s = '0,2,7,0'
# s = '2,4,1,2'

stopS = s.split(',').join

arr = s.split(',').map {|o| o.to_i}

puts arr.inspect

mem = {}

count = 1
while true
  highestNum = arr[0]
  highestIndex = 0

  for i in 1..arr.length-1
    if arr[i] > highestNum
      highestNum = arr[i]
      highestIndex = i
    end
  end
  # puts "highestNum: #{highestNum}, highestIndex: #{highestIndex}"

  arr[highestIndex] = 0

  nextIndex = highestIndex+1
  for i in 1..highestNum
    if (nextIndex > arr.length-1)
      nextIndex = 0
    end
    # puts "adding to index #{nextIndex}"

    arr[nextIndex] = arr[nextIndex] + 1

    # puts i
    # arr
    nextIndex = nextIndex + 1
    # puts arr.inspect
  end

  newS = arr.join()
  puts newS

  # if mem.has_key?(newS)
  if newS == stopS
    puts arr.inspect
    puts "most count: #{count}"
    return
  end
  mem[newS] = newS
  # puts mem.inspect

  count += 1
  # if count == 50
  #   return
  # end
end