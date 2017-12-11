ss = File.read('day5_input.txt')
lines = ss.split("\n")
# lines = [0, 3, 0, 1, -3]

steps = lines.map {|l| l.to_i}
len = steps.length - 1
index = 0
newIndex = 0
count = 0

while true
  # puts steps.inspect
  # puts "newIndex = #{newIndex}, index = #{index}"

  if (newIndex > len)
    puts count
    return
  end

  newIndex = index + steps[index]
  # puts "newIndex = #{newIndex}, index = #{index}"

  if steps[index] >= 3
    steps[index] = steps[index] - 1
  else
    steps[index] = steps[index] + 1
  end

  index = newIndex
  # puts "index = #{index}, val = #{steps[index]}"
  count += 1
end
